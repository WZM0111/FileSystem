<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="common.dao.FileDao"%>
<%@page import="common.bean.FileInfoBean"%>
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
    
    
    <title>My JSP 'head.jsp' starting page</title>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
<script src="./bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="./bootstrap-3.3.5-dist/css/bootstrap.min.css" />

<style>

body{
background-color: #F6F6F6;
font-size: 16px;
}
.head1{
	width:100%;
	margin: 0 auto;
	
}
.nav1{
	background-color:#325DA7;
	font-size:16px;
}

.head1 .form-control{
	height:50px;font-size:16px;
    border-radius:0px;}
.head1 .btn-lg {
    padding: 10px 16px;
    font-size: 16px;
    line-height: 1.3333333;
    border-radius: 0px;
}
.head1 .btn {
    padding:6 px 12px;
	height:50px;
	width:100px;
    font-size: 16px;
  
    border-radius: 0px;
}

.nav1 a {
    color:#FFF;
    text-decoration: none;
}
.nav-tabs.nav-justified>li>a {
     border-bottom:0px;
     border-radius: 0px; 
}
.nav-tabs>li>a {
   
    border-radius: 0px; 
}

.ss{
		margin-left:15%;
		margin:0 auto;
		width:70%;
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
  <!--头部-->
<div class="head1">
  <div style="float: right;margin-right:5%;margin-top: 5px; font-size: 14px;">
      <%
        //获取用户是否登录
      HttpSession session2=request.getSession();
      UserInfoBean userinfo=( UserInfoBean)session2.getAttribute("userinfo");
     if(userinfo==null){
      %>
           <a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a>
           &nbsp; &nbsp; 
           <a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a>   
           <%}else{
           
           %> 
               欢迎你，<a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=userinfo.getUser_account()%></a><br>
           <input type="hidden" name="useraccount" value="<%=userinfo.getUser_account() %>"/>
               <%  String classes=userinfo.getClasses();
    	     String vipenddate=userinfo.getVipenddate();
    	    
    	   if("1".equals(classes)){
     			%>
                             你的级别为<font color="blue">会员</font> <br>
         <%}else{%>
        	  你的级别为<font color="blue">普通用户</font> <br>
        <%}%> 
          <p align="right"><a href="info.jsp">充值</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/logout" onclick="return confirm('确认退出？')"><span class="glyphicon glyphicon-log-out"></span>退出</a> </p>
<%} %>
  </div>
          
<form class="form-horizontal" role="form" action="filePageListAction" method="post"  id="show">
	<div class="form-group">
    <table width="60%" align="center" style="float: left;margin-left: 20%"><tr><td width="20%" align="left">
		<label for="firstname" class="col-sm-2 control-label"><a href="index.jsp"><img src="./image/logo1.png" width="200" height="100" /></a></label></td>
        
        <div class="col-sm-10"><td width="65%">
		<br /><br />
			<input type="text" class="form-control" id="firstname" name="content" placeholder="请输入内容">
		</td></div>
        <td width="15%"><br /><br /><button type="button" class="btn btn-primary btn-lg" onclick="showFirstPage()" >搜索</button>
        
        </td>
        </tr>
        </table>
	</div>
    </form>
 </div>
 

<!--导航条-->

<div class="nav1">
<jsp:useBean id="filedao1" class="common.dao.impl.FileDaoImpl" scope="session"></jsp:useBean>
<div class="ss">
    <ul class="nav nav-tabs nav-justified">
   
    <li><a href="index.jsp">主页</a></li>
    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">分类&nbsp;&nbsp;<b class="caret"></b></a>   
    <ul class="dropdown-menu">
      <%  
              List<FileInfoBean> files=filedao1.findType();
              for(FileInfoBean fileinfobean:files){     	
            %>
                    <li><a href="classify.jsp?filetype=<%=fileinfobean.getFileType() %>"><%=fileinfobean.getFileType() %></a></li>
                    <%
            	  } %>
                    
                </ul>
    </li>
    <li><a href="#">关于我们</a></li>
   <%if(userinfo==null){ %>
    <li><a href="Login.jsp" onclick="return confirm('您还没有登录，请先登录！')">个人中心</a></li>
    <%}else{ %>
    <li><a href="userInformation.jsp" >个人中心</a></li>
    <%} %>
    <li></li>
    <li></li>
    <li></li>
<li></li>
  </ul>
  </div>
</div> 
  </body>
</html>
