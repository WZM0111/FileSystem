<%@page import="common.dao.UserDao"%>
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
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./css/userInfo.css" rel="stylesheet" />
<link href="./css/dashboard.css" rel="stylesheet"/>
<link href="./css/style.css" rel="stylesheet" type="text/css" />

<script src="./js/userInfo.js"></script>
<title>个人信息</title>
<style type="text/css">
.form-control{
    height: 42px;
    border-radius: 3px;
    color: #694545;
}

.nav-tabs.nav-justified>li>a {
  
    font-size: 16px;
}
.form-horizontal .control-label {
   
    font-size: 16px;
}
</style>



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
						<li class="active"><a href="userInformation.jsp">个人基本信息</a></li>
						<li><a href="uploadFile.jsp">上传文件</a></li>
						<li><a href="myUpload.jsp">我的上传</a></li>
						<li><a href="myDownload.jsp">我的下载</a></li>
						<li><a href="myIncome.jsp">我的收益</a></li>
						<li><a href="resetPasswd.jsp">修改密码</a></li>
					</ul>
					<div class="tab-content">
							<div class="tab-pane active" id="panel-887901">
								<div class="top"></div> 
								<div class="panel panel-default">

									<div class="panel-heading">

										<p>
											<h3>
												<b>个人基本信息</b>
											</h3>
                                            <%
                                            HttpSession session1 = request.getSession();
											UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo"); 
											UserDao dao=new UserDaoImpl();
											UserInfoBean userinfo9=dao.findUserByName(userinfo.getUser_account());
											String vipenddate=userinfo9.getVipenddate();
											String type=userinfo.getClasses();
											if("1".equals(type)){
																					
											%>
											<p align="right">会员截止日期：<%=vipenddate %></p>
											<%} %>
										</p>
									</div>
									<div class="panel-body">

										<%
										
											String username = userinfo.getUser_account();
											UserDaoImpl userImpl = new UserDaoImpl();
											UserInfoBean user = userImpl.findUser(username);
										%>
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label for="firstname" class="col-sm-2 control-label">用户ID：</label>
												<div class="col-sm-9">
													<input class="form-control" id="uerID" type="text"
														value="<%=user.getUser_account()%>" placeholder=""
														disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-2 control-label">昵称：</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="nickname"
														value="<%=user.getUsername()%>" placeholder="" disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-2 control-label">性别：</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="sex"
														value="<%=user.getGender()%>" placeholder="" disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-2 control-label">年龄：</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="age"
														value="<%=user.getAge()%>" placeholder="" disabled/>
												</div>
											</div>
										</form>
										<div class="form-group">
											<center>
												<a id="modal-628289" href="#modal-container-628289"
													role="button" class="btn" data-toggle="modal">填写/修改个人
													信息</a>
											</center>

											<div class="modal fade" id="modal-container-628289"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<form class="form-horizontal" role="form"
															id="resetuserinfo" method="post" action="updateuser">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">×</button>
																<h4 class="modal-title" id="myModalLabel">填写/修改用户信息：</h4>
															</div>

															<div class="modal-body">

																<div class="form-group">
																	<label for="firstname" class="col-sm-2 control-label">用户ID：</label>
																	<div class="col-sm-10">
																		<input class="form-control" id="disabledInput"
																			type="text" placeholder="" value="用户ID不可修改" disabled>
																	</div>
																</div>
																<div class="form-group">
																	<label for="lastname" class="col-sm-2 control-label">昵称：</label>

																	<div class="col-sm-10">
																		<input type="text" class="form-control" id="nickname1"
																			name="nickname1" value="<%=user.getUsername()%>"
																			placeholder="">
																	</div>
																</div>
																<div class="form-group">
																	<label for="lastname" class="col-sm-2 control-label">性别：</label>
																	<div class="col-sm-10">
																		<div class="radio-inline">
																			<label> <input type="radio" name="sex1"
																				id="optionsRadios1" value="1"
																				<%if ("男".equals(user.getGender())) {%>
																				checked="checked" <%}%>> 男
																			</label>
																		</div>
																		<div class="radio-inline">
																			<label> <input type="radio" name="sex1"
																				id="optionsRadios2" value="2"
																				<%if ("女".equals(user.getGender())) {%>
																				checked="checked" <%}%>>女
																			</label>
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<label for="lastname" class="col-sm-2 control-label">年龄：</label>
																	<div class="col-sm-10">
																		<input type="text" class="form-control" id="age1"
																			name="age1" value="<%=user.getAge()%>"
																			placeholder="">

																	</div>
																</div>

															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">关闭</button>

																<button type="submit" class="btn btn-primary">保存</button>
															</div>
														</form>

													</div>
												</div>
											</div>

										</div>

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
