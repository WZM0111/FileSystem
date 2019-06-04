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
<%@page import="common.bean.UserInfoBean"%>
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
						<li><a href="uploadFile.jsp">上传文件</a></li>
						<li><a href="myUpload.jsp">我的上传</a></li>
						<li class="active"><a href="myDownload.jsp">我的下载</a></li>
						<li><a href="myIncome.jsp">我的收益</a></li>
						<li><a href="resetPasswd.jsp">修改密码</a></li>
					</ul>
						                              <%
											                           HttpSession session1 = request.getSession();
																			
																			 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
																			String username =userinfo.getUser_account();
																			UserDaoImpl userImpl = new UserDaoImpl();
																			UserInfoBean user = userImpl.findUser(username);
										                %>
						<div class="tab-content">
							
						<div class="tab-pane active" id="panel-165803">
							<div class="top"></div>
								<div class="panel panel-default">

									<div class="panel-heading">

										<p>
											<h3>
												<b>我的下载</b><br/>
											</h3>

										</p>
									</div>
									<div class="panel-body">
								<form method="post" action="file?action=delete1" class="form-horizontal" role="form" id="downloadfile">
							<table class="table table-hover">
							
								<caption>下载列表</caption>
								<thead>
									<tr>
										<th>序号</th>
										<th>文件名</th>
										<th>文件类型</th>
										<th>下载券</th>
										<th>下载日期</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
													<%
														int currentPage1 = 1;
														String strPage1 = request.getParameter("page1");

														if (strPage1 != null) {
															currentPage1 = Integer.parseInt(strPage1);
														}
														PageBean<FileInfoBean> pageBean1 = filedao.findDfilesByUsername(username, currentPage1, Constants.PAGE_NUM);
													

														int count1 = (currentPage1 - 1) * Constants.PAGE_NUM + 1;
														for (FileInfoBean file1 : pageBean1.getRecordList()) {
													%>
													<%
									//List<FileInfoBean> files1=filedao.findDfilesByUsername(username);
														  //int count1=1;
														  //for(FileInfoBean file1:files1){
								%>
									<tr>
										<td><input type="hidden" value="<%=file1.getFileId()%>" name="fid" id="fid"/><input type="hidden" value="<%=count1%>" name="count1" id="count1"/><%=count1++%></td>
										<td><div class="fe"><%=file1.getFileName()%></div></td>
										<td><%=file1.getFileType()%></td>
										<td><%=file1.getPrice()%></td>
										<td><%=file1.getDownloaddate()%></td>
										<td>
											&nbsp;<input type="checkbox" value="<%=file1.getFileId()%>" name="fileid1"> 
    									</td>
									</tr>
									<%
										}
									%>
									
									<tr>
										<td colspan="6" align="right">
											&nbsp;<input type="checkbox" id="inlineCheckbox1" value="11" onclick="sel('fileid1')">&nbsp;全选 
										</td>
									</tr>
									<tr>
										<td>
											当前<%=pageBean1.getCurrentPage()%>/<%=pageBean1.getPageCount()%>
										</td>
										<td colspan="4" align="center">
											<ul class="pagination">
													<li><a href="?page1=<%=pageBean1.prevPage()%>" >&laquo;</a></li>
													<%
														for(int i=pageBean1.getBeginPageIndex();i<=pageBean1.getEndPageIndex();i++){
													%>
													<li><a href="?page1=<%=i%>" ><%=i%></a></li>
													<%
														}
													%>
													<li><a href="?page1=<%=pageBean1.nextPage()%>" >&raquo;</a></li>
												</ul>
										</td>
										<td>
											共<%=pageBean1.getPageCount()%>页
										</td>
									</tr>
									<tr>
										<td colspan="6" align="right">
											<a href="" onclick="return confirm('确认删除下载记录吗?')">
											<input type="submit" class="btn1 btn-primary" value="删除"/>
											</a>
										</td>
									</tr>
								</tbody>
							</table>
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
