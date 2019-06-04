<%@page import="common.dao.impl.UserDaoImpl"%>
<%@page import="common.dao.UserDao"%>
<%@page import="common.bean.UserInfoBean"%>
<%@page import="common.bean.Comment"%>
<%@page import="common.dao.impl.showFileImpl"%>
<%@page import="common.dao.showFileDao"%>
<%@page import="common.bean.FileInfoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>show</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    
    <link href="showfile/resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="showfile/resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="showfile/data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="showfile/files/show/styles.css" type="text/css" rel="stylesheet"/>
    <script src="showfile/resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="showfile/resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="showfile/resources/scripts/prototypePre.js"></script>
    <script src="showfile/data/document.js"></script>
    <script src="showfile/resources/scripts/prototypePost.js"></script>
    <script src="showfile/files/show/data.js"></script>
    <script type="showfile/text/javascript"></script>
     <style type="text/css">
body{
width: 100%;
}
.head0 {
	width: 100%;
	margin: 0 auto;
	height: 60px;
	background-color: #eee;
}

.head0 .form-control {
	height: 40px;
	font-size: 14px;
	border-radius: 0px;
}

.head0 .btn-lg {
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.3333333;
	border-radius: 0px;
}

.head0 .btn {
	padding: 6 px 12px;
	height: 40px;
	width: 100px;
	font-size: 14px;
	border-radius: 0px;
}
a{
color: #337ab7;
}
</style>
 <script type="text/javascript">
 $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
 $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
 $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
		function SetWinHeight(obj) {
			var win=obj;
			if(document.getElementById){
				if(win&&!window.opera){
					if(win.contentDocument && win.contentDocument.body.offsetHeight)
						win.height=win.contentDocument.body.offsetHeight;
					else if(win.document&& win.document.body.scrollHeight){
						win.height=win.Document.body.scrollHeight;
					}
				}
			}
   		}
		
		function openfile()
	  	{
	  		var fileId=document.getElementById("fileId").value;
	  		var win=document.getElementById("win");
	  		win.src="include.jsp?fileId="+fileId;
	  	}
		setTimeout(function() {
			// IE
			if(document.all) {
				document.getElementById("openFile").click();
			}
			// 其它浏览器
			else {
				var e = document.createEvent("MouseEvents");
				e.initEvent("click", true, true);
				document.getElementById("openFile").dispatchEvent(e);
			}
		}, 500);
		
		function download() {
			 if(login_check()){
				  document.loginForm.action="<%=path%>/downloadFile?method=login";
				  document.loginForm.submit();
				  return true;
			 }
		}
	
			function review()
			{
					document.getElementById("comment").action="commentAction";
					document.getElementById("comment").submit();
			}
			 function showFirstPage()
			  	{
			  		document.getElementById("show").action="<%=path%>/filePageListAction?method=firstPage";
			  		document.getElementById("show").submit();
			  	}
		 
    </script>
    	
  
  </head>
  
  <body>
   <div class="head0">
		<form class="form-horizontal" role="form" action="filePageListAction"
			method="post" id="show">
			<div class="form-group">
				<table width="70%" align="center">
					<tr>
						<td width="25%" align="left"><a href="index.jsp"><img
								src="image/logo1.png" width="150px" height="60px" /></a>
						</td>
						<td width="45%"><input type="text" class="form-control"
							id="firstname" name="content" placeholder="请输入内容">
						</td>
						<td width="10%">

							<button type="button" class="btn btn-primary btn-lg"
								onclick="showFirstPage()">搜索</button>
						</td>
						<td width="20%" align="right" style="font-size: 14px">
							<%
								//获取用户是否登录
								HttpSession session1 = request.getSession();
								UserInfoBean userinfo = (UserInfoBean) session1
										.getAttribute("userinfo");
								if (userinfo == null) {
							%> <a href="Login.jsp"><span class="glyphicon glyphicon-user"></span>
								注册</a> &nbsp; &nbsp; <a href="Login.jsp"><span
								class="glyphicon glyphicon-log-in"></span> 登录</a> 
								<%
 								} else {
 								%> 
 							欢迎你，<a href="#"><span class="glyphicon glyphicon-user">
 							</span>&nbsp;&nbsp;<%=userinfo.getUser_account()%></a><br>
							<%  String classes=userinfo.getClasses();
    	     String vipenddate=userinfo.getVipenddate();
    	    
    	   if("1".equals(classes)){
     			%>
                             你的级别为<font color="blue">会员</font> <br>
         <%}else{%>
        	  你的级别为<font color="blue">普通用户</font> <br>
        <%}%> 
							<p align="right">
								<a href="info.jsp">充值</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="<%=request.getContextPath()%>/logout"
									onclick="return confirm('确认退出？')"><span
									class="glyphicon glyphicon-log-out"></span>退出</a>
							</p> <%}%>
						</td>
					</tr>
				</table>

			</div>
		</form>

	</div>
 
 	<p hidden>
		<a id="openFile" onclick="openfile()"></a>
		<input type="hidden" id="fileId" name="fileId" value="<%=request.getParameter("id")%>"> 
	</p>
				
    <div id="base" class="" style= "backgroud-color:#f5f5f5">

      
	<form enctype="multipart/form-data" method="post" accept-charset="utf-8" action="/convert" id="upload-form">
      <!-- author (矩形) -->
     
     
      <%
        int id=Integer.parseInt(request.getParameter("id"));
      	showFileDao show=new showFileImpl();
        FileInfoBean file=show.fileinfo(id);
     
        System.out.println("showfile"+file.getPrice());
        %> 
         <div style="margin-top: 30px;text-align: center;width:1366px;">
         <div align="center" >
        <font size="6"> <%=file.getFileName()%></font>
          </div>
          <br>
         <table align="center"> 
          	<tr><td><font color:#f5f5f5>上传人：<%=file.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
			 <td>格式：<%=file.getFileForm()%></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
           	<td>上传时间：<%=file.getUploadDate()%></td></tr>
          </table>
          </div>
</form>
     
      
      <!-- Unnamed (矩形) -->
      <div id="u41" class="ax_default box_1" align="center">
         <iframe width="100%"  src="include.jsp" align="center"  id="win" name="win" onload="Javascript:SetWinHeight(this)" frameborder="0" border="0" marginwidth="0" marginheight="0" scrolling="no"  ></iframe>
        
        <!-- Unnamed () -->
        <div id="u42" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u43" class="ax_default label">
        <div id="u43_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u44" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

       
      
      <!-- Unnamed (矩形) -->
      <div id="u47" class="ax_default label">
        <div id="u47_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u48" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

     
	<%
	//HttpSession session2=request.getSession();
	//UserInfoBean userinfo=(UserInfoBean)session2.getAttribute("userinfo");
	if(userinfo!=null){
	String classes=userinfo.getClasses();
	String vipenddate=userinfo.getVipenddate();
	UserDao userImpl = new UserDaoImpl();
	Double balance=userImpl.findUserAccount(userinfo.getUser_account());
	
	System.out.println("w2sjajjj"+classes);
	
	if("1".equals(classes)){
	%>
      <a  href="<%=path%>/downloadFile?fileid=<%=file.getFileId()%>&&fileForm=<%=file.getFileForm()%>" >
      <div id="u52" class="ax_default primary_button">
        <div id="u52_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u53" class="text"><br>
          <p><span align="center"><font size="2px">免费下载</font></span></p>
        </div>
      </div>
     </a>
     <%}else{
    	Double price=file.getPrice();
        if(balance < price){
     %>
     

      <div id="u45" class="ax_default label">
        <div id="u45_div" class=""></div>
       
        <div id="u46" class="text">
          <p><span align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4px">下载文档需要</font></span></p>
        </div>
      </div> 

	 <!-- Unnamed (矩形) -->
      <!-- Unnamed (文本框) -->
      <div id="u51" class="ax_default text_field" align="center">
        
        <font size="4px"><%=file.getPrice() %></font>
      </div>
     
       <a  href="<%=path%>/info.jsp" onclick="return confirm('您的余额不足，请先充值！')">
      <div id="u52" class="ax_default primary_button">
        <div id="u52_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u53" class="text"></br>
          <p><span align="center"><font size="4px">下载</font></span></p>
        </div>
      </div>
     </a>
  
	  <%  
	}else{%>
	 <div id="u45" class="ax_default label">
        <div id="u45_div" class=""></div>
       
        <div id="u46" class="text">
          <p><span align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4px">下载文档需要</font></span></p>
        </div>
      </div> 
		<div id="u51" class="ax_default text_field" align="center">
	        &nbsp;&nbsp;&nbsp;<font size="4px"><%=file.getPrice()%></font>
	      </div> 
	       <a  href="<%=path%>/downloadFile?fileid=<%=file.getFileId()%>&&fileForm=<%=file.getFileForm()%>" >
	      <div id="u52" class="ax_default primary_button">
	        <div id="u52_div" class=""></div>
	        <!-- Unnamed () -->
	        <div id="u53" class="text"><br>
	          <p><span align="center"><font size="4px">下载</font></span></p>
	        </div>
	      </div>
	     </a>
	<% }
	}
%>
     

    
      <div id="u54" class="ax_default label">
        <div id="u54_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u55" class="text">
          <p><span>您的评论</span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <form action="" method="post" id="comment">
      <div id="u56" class="ax_default text_area">
      
      
      <textarea id="comm" name="comm" type="text" size="0" 
      style="max-width:650px;max-height:180px;min-width:650px;min-height:180px"></textarea>

      <input id="fileid" name="file_id" type="hidden" value="<%=request.getParameter("id")%>">
      
     
      </div>
      
      <!-- Unnamed (矩形) -->
     
      <div id="u57" >
       
        <!-- Unnamed () -->
        <div id="u58" class="text">
          <p><span><input type="button" value="发布评论" onclick="review()"/></span></p>
        </div>
      </div>
	</form>
		
      <!-- Unnamed (矩形) -->
      <div id="u59" class="ax_default label">
        <div id="u59_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u60" class="text">
        <div>
          <p><span><font size="5">用户评论</font></span></p>
          <br>
        </div>
        
          <table width="800px">
          
        <%
        
		
		System.out.println("aaa"+id);
		List<Comment> comment=show.filecomment(id);
		%>
	    	<%
	    		    for(Comment coms: comment) {
	    			System.out.println("1111");
	    	%>
	    	
	 	   	<tr><td>用户名：<%=coms.getUsername()%></td>
	 	   	<td align="right""><%=coms.getDate()%></td></tr>
	 	   	<tr><td><font size="-1"><%=coms.getContents()%></font></td></tr>
	 	   	<tr><td style="width:900px " colspan="2"><hr></td></tr>	
	    	<%
	    		}
		
	
	    	%>
	    </table>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u61" class="ax_default line">
        <img id="u61_img" class="img " src="images/show/u61.png"/>
        <!-- Unnamed () -->
        <div id="u62" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u63" class="ax_default label">
        <div id="u63_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u64" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u65" class="ax_default line">
        <img id="u65_img" class="img " src="images/show/u65.png"/>
        <!-- Unnamed () -->
        <div id="u66" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
      <%} %>
    </div>
  </body>
</html>
