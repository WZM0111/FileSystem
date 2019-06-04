<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="common.dao.impl.UserDaoImpl"%>
<%@ page import="common.dao.impl.FileDaoImpl"%>

<%@ page import="common.utils.PageBean"%>
<%@ page import="common.utils.Constants"%>
<%@ page import="common.bean.FileInfoBean"%>
<%@ page import="common.bean.IncomeRecordBean"%>
<%@ page import="common.bean.UserInfoBean"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link href="./css/userInfo.css" rel="stylesheet" />

<link href="./css/dashboard.css" rel="stylesheet" />
<link href="./css/style.css" rel='stylesheet' type='text/css' />

<script src="./js/userInfo.js"></script>
<title>个人信息</title>
<style type="text/css">
.form-control{
    height: 42px;
    border-radius: 3px;
    color: #694545;
}

</style>
<!-- <script type="text/javascript">
		function upload() {  
	     var formData = new FormData($( "#upload-form" )[0]);  
	     $.ajax({  
	          url: 'upload?method=convert' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (returndata) {  
	            	$("#preview").html(JSON.parse(returndata).content);
	          },  
	          error: function (returndata) {  
	        	  console.log("error:");
	          }  
	     });  
		}  
		
	</script> -->
</head>

<body>
	<jsp:useBean id="filedao" class="common.dao.impl.FileDaoImpl" scope="session"></jsp:useBean>
	
	
	
	<!--头部-->
	<jsp:include page="common/head.jsp"></jsp:include>
	
	<div class="container">
		<div class="top"></div>
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
			
			<%
				String message=(String)request.getAttribute("message");
				if(message!=null){
			%>
				<script type="text/javascript">
					alert("<%=message%>");
				</script>
			<%
				}
			%>	
			
			<div class="">
				<div class="tabbable" id="tabs-105561">
					<ul class="nav nav-tabs nav-justified">
						<li><a href="userInformation.jsp">个人基本信息</a></li>
						<li class="active"><a href="uploadFile.jsp">上传文件</a></li>
						<li><a href="myUpload.jsp">我的上传</a></li>
						<li><a href="myDownload.jsp">我的下载</a></li>
						<li><a href="myIncome.jsp">我的收益</a></li>
						<li><a href="resetPasswd.jsp">修改密码</a></li>
					</ul>
						<%
						 HttpSession session1 = request.getSession();
						/*LoginBean loginBean = (LoginBean) session1.getAttribute("login"); */
						 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
						String username = userinfo.getUser_account();
							UserDaoImpl userImpl = new UserDaoImpl();
							UserInfoBean user = userImpl.findUser(username);
						%>
						<div class="tab-content">
							
							<div class="tab-pane active" id="panel-165801">
							<div class="top"></div>
								<div class="panel panel-default">

									<div class="panel-heading">

										<p>
											<h3>
												<b>上传文件</b><br/>
											</h3>

										</p>
									</div>
									<div class="panel-body">
										<form id="upload-form" class="form-horizontal" role="form" method="post" accept-charset="utf-8" action="<%=path %>/upload" ENCTYPE="multipart/form-data">
											<div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">用户ID：</label>
												<div class="col-sm-2">
													<input class="form-control" id="uerID" type="text"  value="<%=username%>" placeholder="" disabled/>
												   <input type="hidden" name="username1" value="<%=username%>"/>
												</div>
											</div>
											
											<div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">文件类型：</label>
												<div class="col-sm-2">
												 <input type="text" name="type" list="browsers" class="form-control"
														autocomplete="off"/> <datalist id="browsers" >
													
													<%
															List<FileInfoBean> files = filedao.findType();
															
															for (FileInfoBean fileinfobean : files) {
																
														%>
														<option  value="<%=fileinfobean.getFileType()%>"><%=fileinfobean.getFileType()%></option>
													<%
														}
													%>	
														</datalist>
												</div>
												
											</div>

                                           <div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">选择文件：</label>
												<div class="col-sm-10">
												
													<label class="sr-only" for="file">文件输入</label>
													<input type="file" id="file" name="file" />
												</div>
											</div>
											<div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">简介：</label>
												<div class="col-sm-10">
													<textarea class="form-control" rows="3" name="introduce"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">所售金额：</label>
												<div class="col-sm-10">
													<input class="input02" id="reduce" type="button" value="-" onclick="control()"/>
													<input class="input01" type="text" id="num"  name="fileprice" value="0"/>
													
													<input class="input02" id="add" type="button" value="+" onclick="control()"/>&nbsp;&nbsp;下载券
												</div>
											</div>
											<div class="form-group">
											<center>
												<button type="submit" class="btn btn-default"  >确认上传</button></center>
											</div>
										</form>
										
						</div>
						</div>
						</div>
						
				</div>
				</div>
				</div>
			</div>
		
		<div class="col-md-1 column">
		</div>
	</div>
	</div>

</body>
</html>
