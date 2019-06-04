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
<link href="./css/style.css" rel='stylesheet' type='text/css' />

<script src="./js/userInfo.js"></script>
<title>个人信息</title>
<style type="text/css">
.form-control{
    height: 42px;
    border-radius: 3px;
    color: #694545;
}
.fe {
    width: 130px;  
    white-space: nowrap;
    overflow: hidden;
	text-overflow: ellipsis;
	
}
</style>
</head>

<body>
	<jsp:useBean id="filedao" class="common.dao.impl.FileDaoImpl" scope="session"></jsp:useBean>
	
	
	
	<!--头部-->
	<jsp:include page="common/head.jsp"></jsp:include>
	
	
<!-- 内容区 -->
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
									
			 <%
											                           HttpSession session1 = request.getSession();
																			
																			 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
																			String username = userinfo.getUser_account();
																		UserDaoImpl userImpl = new UserDaoImpl();
																		UserInfoBean user = userImpl.findUser(username);
													%>
			
			<div class="">
				<div class="tabbable" id="tabs-105561">
					<ul class="nav nav-tabs nav-justified">
						<li><a href="userInformation.jsp">个人基本信息</a></li>
						<li><a href="uploadFile.jsp">上传文件</a></li>
						<li><a href="myUpload.jsp">我的上传</a></li>
						<li><a href="myDownload.jsp">我的下载</a></li>
						<li class="active"><a href="myIncome.jsp">我的收益</a></li>
						<li><a href="resetPasswd.jsp">修改密码</a></li>
					</ul>
						
						<div class="tab-content">
							
						
						<div class="tab-pane active" id="panel-165804">
							<div class="top"></div>
								<div class="panel panel-default">

									<div class="panel-heading">
									

										<p>
											<h3>
												<b>个人收益</b><br />
											</h3>

										</p>
									
									</div>
									<div class="panel-body">
									<form method="post" action="changeincome">
										<%
											double userincome = userImpl.getIncome(username);
											double balance=0;
											
											//int downloadnum = userImpl.getDownloadNum(username);
											balance = userImpl.findUserAccount(username);
											
										%>
										个人总收益：<font class="font04"><%=userincome%></font>&nbsp;下载券
										<button type="submit" class="btn2 btn-warning" >兑换为余额</button><br/>
										下载券余额：<font class="font04"><%=balance%></font>&nbsp;下载券<br/>
										<!--  
										<button type="button" class="btn2 btn-warning" title="我的收益"
											data-container="body" data-toggle="popover"
											data-placement="right" data-content="您的总下载量为：">下载量</button>-->
											<div class="top"></div>
										<div class="panel-group" id="panel-142243">
											<div class="panel panel-default">
												<div class="panel-heading">
													<a class="panel-title collapsed" data-toggle="collapse"
														data-parent="#panel-142243" href="#panel-element-9577">查看收益详情</a>
												</div>
												<%
													List<IncomeRecordBean> records = userImpl.getIncomeRecord(username);
																							int recordnum=1;
												%>
												<div id="panel-element-9577" class="panel-collapse collapse">
													<table class="table">
														<thead>
															<tr>
																<th>序号</th>
																<th>文件名</th>
																<th>文件格式</th>
																<th>下载时间</th>
																<th>所获收益</th>
															</tr>
														</thead>
														<tbody>
														<%
															for(IncomeRecordBean record:records){
														%>
															<tr class="info">
																<td><%=recordnum++ %></td>
																<td><div class="fe"><%=record.getFilename() %></div></td>
																<td><%=record.getFileform() %></td>
																<td><%=record.getDownloaddate() %></td>
																<td><%=record.getPrice() %></td>
															</tr>
															<% } %>
														</tbody>
													</table>
												</div>
											</div>
										</div>


									</div>
									</form>
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
