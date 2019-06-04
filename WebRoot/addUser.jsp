<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/bootstrap.min.js"></script>
<title>完善用户信息</title>
<style type="text/css">
.form0{
	margin-top:150px;
}

@media screen and (min-width: 768px) {
  .jumbotron {
    padding-top: 50px;
    padding-bottom: 60px;
  }
  .container .jumbotron,
  .container-fluid .jumbotron {
    padding-right: 35px;
    padding-left: 35px;
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px;
  }
}
</style>

<script type="text/javascript">

function check() {
	var nicknm = document.getElementById("nickname").value;
	
	if (nicknm == ""||nicknm.length > 15) {
		if(nicknm == "")
			document.getElementById("msg").innerHTML = "昵称不可为空！";
			if (pass.length > 15)
				document.getElementById("msg").innerHTML = "昵称长度>15,请重新输入！";
			return false;
		}
	return true;
}
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body style="background:rgba(0,0,0, .2) url(images/login_regist/3.jpg) no-repeat center center; background-size:cover">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column"></div>
			<div class="col-md-6 column">
			<div class="jumbotron form0">
			<%String username = request.getParameter("username");
			//System.out.println(username);%>
			<h3>请完善用户信息:</h3><br>
				<form class="form-horizontal " role="form" method="post" action="userlogin?method=add&username=<%=username%>">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">用户ID:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username" name="username" value="<%=username%>" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">昵称:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="nickname" name="nickname" placeholder="请输入昵称">
						</div>
					</div>
						<div class="form-group">
							<label for="message" class="col-sm-3 control-label"></label>
							<div>
								<span id="msg" style="color: red;font-size:14px">${errMsg}</span>
							</div>
						</div>
						<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">性别:</label>
						<div class="col-sm-10">
							<div class="radio-inline">
								<label> <input type="radio" name="sex"
									id="optionsRadios1" value="1"> 男
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="sex"
									id="optionsRadios2" value="2">女
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">年龄:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="age" name="age"
								placeholder="请输入年龄">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="col-md-3 column"></div>
		</div>
	</div>
</body>
</html>
