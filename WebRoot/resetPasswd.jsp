<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="common.bean.LoginBean"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Integer" %>

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
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="./js/userInfo.js"></script>
<link href="./css/dashboard.css" rel="stylesheet" type="text/css" />
<link href="./css/style.css" rel="stylesheet" type="text/css" />
<link href="./css/userInfo.css" rel="stylesheet"  />


<title>个人信息</title>
<style type="text/css"> 

 .form-control{
    height: 42px;
    border-radius: 3px;
    color: #694545;
}

</style>

<script >
function check() {
	var pass = document.getElementById("password_old").value;
	var newpass = document.getElementById("password_1").value;
	var repass = document.getElementById("password_2").value;

	var pattern_char = /[a-zA-Z]/g;

	var pattern_num = /[0-9]/g;
	
	var ls1=0;
	
	var ls2=0;

	if(newpass.match(pattern_char)!=null&&newpass.match(pattern_char).length>=4){ ls1++; }

	if(newpass.match(pattern_num)!=null&&newpass.match(pattern_num).length>=4){ ls2++; }

	if (pass == ""||pass.length > 15) {
	if(pass == "")
		document.getElementById("msg").innerHTML = "请输入当前密码";
		if (pass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	} else if (newpass == ""||newpass.length > 15) {
         if(newpass == "")
		document.getElementById("msg").innerHTML = "请输入新密码";
		if (newpass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	}else if (ls1==0||ls2==0) {
		 document.getElementById("msg").innerHTML = "密码必须由至少4个字母与4个数字组成，区分大小写";
		 return false;

	} 
	
	else if (repass == ""||repass.length > 15) {
        if(repass == "")
		document.getElementById("msg").innerHTML = "请确认新密码";
		if (repass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	}
	return true;

}
</script>
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
			
		
				<div class="tabbable" id="tabs-105561">
					<ul class="nav nav-tabs nav-justified">
						<li><a href="userInformation.jsp">个人基本信息</a></li>
						<li><a href="uploadFile.jsp">上传文件</a></li>
						<li><a href="myUpload.jsp">我的上传</a></li>
						<li><a href="myDownload.jsp">我的下载</a></li>
						<li><a href="myIncome.jsp">我的收益</a></li>
						<li class="active"><a href="resetPasswd.jsp">修改密码</a></li>
					</ul>

						<%
						
                        HttpSession session1 = request.getSession();
								/*LoginBean loginBean = (LoginBean) session1.getAttribute("login"); */
								 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
								String username =userinfo.getUser_account();
								UserDaoImpl userImpl = new UserDaoImpl();
								UserInfoBean user = userImpl.findUser(username);
						%>
						<div class="tab-content">
							
						<div class="tab-pane active" id="panel-165806">
							<div class="top"></div>
								<div class="panel panel-default">

									<div class="panel-heading">

										<p>
											<h3>
												<b>修改密码</b>
											</h3>

										</p>
									</div>
									<div class="panel-body">
							<form class="form-horizontal" role="form" id="resetpasswordform" method="post">
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">当前密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="password_old" name="password_old"
											placeholder="" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">新密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="password_1" name="password_1"
											placeholder="" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">确认新密码：</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="password_2" name="password_2"
											placeholder="" />
									</div>
								</div>
								<div class="form-group">
									<label for="message" class="col-sm-3 control-label"></label>
									<div>
										<span id="msg" style="color: red;font-size:14px">${errMsg}</span>
									</div>
								</div>
								<center>
								<a href='javascript:check1()'>
									<button type="button" class="btn1 btn-primary"  >确认修改</button></a>
								</center>
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
