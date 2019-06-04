<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="<%=path %>/static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=path %>/static/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="<%=path %>/static/pdfobject.js"></script>
   <script type="text/javascript">
    function load(){  
	    $("#openFile").click(); 
	}
	 function upload() {
			var formData = new FormData($("#upload-form")[0]);
			$.ajax({
				url : 'openFile?method=convert',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					$("#pdf").hide();
					$("#ppt").hide();
					var fileId=returndata.split(",");
					if(fileId[0]==="pdf"){
						let src = "<%=path%>/upload/"+ fileId[1] +".pdf#scrollbars=0&toolbar=0&statusbar=0";
						$("#pdf").attr('src', src);
						$("#pdf").show();
						$("#ppt").hide();
					}else if(fileId[0]==="ppt"){
					 	let src = "<%=path%>/upload/html/"+ fileId[1] +".html"; 
						$("#ppt").attr('src', src);
						$("#ppt").show();
						$("#pdf").hide();
					};

					$("#preview").html(JSON.parse(returndata).content);
				},
				error : function(returndata) {
					console.log("error:");
				}
			});
		}
	 
    </script>
</head>
<body onload="load()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"   onbeforecopy="return false">
		<form enctype="multipart/form-data" method="post" accept-charset="utf-8" action="/convert" id="upload-form">
				<div>
					<p hidden>
						<a id="openFile" onclick="upload()"></a>
						<input type="hidden" name="fileId" value="<%=request.getParameter("fileId")%>"> 
					</p>
				</div>
		</form>
		<div id="preview" style="width:100%;height:690px; overflow-x:auto;overflow-y:auto; margin:10px auto 0; background-color: #ffffff">

		<embed id="pdf" src="" type="application/pdf" width="100%" height="100%" display="none">
		 <iframe id="ppt" src="" width="100%" height="100%" display="none"></iframe>
 		</div>
</body>
</html>
