<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.bean.UserInfoBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>tou</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="./bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script src="./bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<style type="text/css">
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
</style>
<script type="text/javascript">
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
						<td width="25%" align="left"><a href="#"><img
								src="image/logo1.png" width="150px" height="60px" /></a>
						</td>
						<td width="45%"><input type="text" class="form-control"
							id="firstname" placeholder="请输入内容">
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
							%> <a href="#"><span class="glyphicon glyphicon-user"></span>
								注册</a> &nbsp; &nbsp; <a href="#"><span
								class="glyphicon glyphicon-log-in"></span> 登录</a> 
								<%
 								} else {
 								%> 
 							欢迎你，<a href="#"><span class="glyphicon glyphicon-user">
 							</span>&nbsp;&nbsp;<%=userinfo.getUser_account()%></a><br>
							你的账户级别为<%=userinfo.getClasses()%> <br>
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
</body>
</html>
