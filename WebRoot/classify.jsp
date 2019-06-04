<%@page import="common.bean.FileInfoBean"%>
<%@page import="common.utils.PageBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类界面</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
.content{
	margin-left:15%;
	width:70%;
	background-color:#fff;
	font-size:10px;
	
	/*border:solid #325DA7 1px;*/
	
	float:left;
	
}

.content th{
text-align:center;
}
.nu .breadcrumb{
border-radius:0px;
font-size: 18px;
background-color:#fff;
}

.nu hr{
  margin-top: 0px;
}
.nu ul{
margin-top: 5px;
margin-bottom: 1px;

}

.nu .breadcrumb > li + li:before {
    color: #000;
    content: "/ ";
    padding: 0 7px;
}
.pages{
margin-left:40%;
font-size:14px;
}

.hrefcolor{
color: #000;
}

.ta{
margin-left: 10px;
margin-right: 10px;
}
</style>
  </head>
  
  <body>
  <jsp:useBean id="filedao" class="common.dao.impl.FileDaoImpl" scope="session"></jsp:useBean>
    <%
    	String filetype = new String(request.getParameter("filetype").getBytes("ISO-8859-1"), "UTF-8");
    	
    %>
    <jsp:include page="common/head.jsp"></jsp:include>
       
    <div class="content">
    
<div class="nu">
  <ul class="breadcrumb">
    <li><a href="#">主页</a></li>
    <li><a href="#"><%=filetype %></a></li>
  </ul>
  <hr>
  </div>
<div class="ta">
       <table class="table table-hover">
       <thead>
      <tr>
      <th >格式</th>
      <th>文档名称</th>
      <th>上传者</th>
      <th>下载量</th>
      <th>上传时间</th>
      </tr>
       </thead>
       <tbody>
      <%
			
			int currentPage=1;
			String strPage=request.getParameter("page");
			if(strPage!=null){
					currentPage=Integer.parseInt(strPage);
			}
			
			PageBean<FileInfoBean> pageBean=filedao.getFilesList(filetype, currentPage, 5);										
			for(FileInfoBean file : pageBean.getRecordList()){
											//i++;
			%>
      <tr align="center">
        <td><%=file.getFileForm() %></td>
        <td><a href="showfile.jsp?id=<%=file.getFileId() %>" class="hrefcolor"><%=file.getFileName() %></a></td>
        <td><%=file.getUsername() %></td>
        <td><%=file.getDownloadnum() %>次</td>
        <td><%=file.getUploadDate() %></td>
      </tr>
      <%} %>
      </tbody>
      </table>
      </div>
      <script type="text/javascript">
      
      </script>
     
     <div class="pages">
      <ul class="pagination">
     
	<li><a href="?page=<%=pageBean.prevPage()%>&filetype=<%=filetype %>">&laquo;</a></li>
	<%
		for(int i=pageBean.getBeginPageIndex();i<=pageBean.getEndPageIndex();i++){
		if(i==pageBean.getCurrentPage()){
	%>
			<li class="active"><a href="?page=<%=i%>&filetype=<%=filetype %>"><%--=pageBean.getCurrentPage()--%>
			
			<%=i %></a></li>
			<%}else{%>
			<li><a href="?page=<%=i%>&filetype=<%=filetype %>"><%--=pageBean.getCurrentPage()--%>
			
			<%=i %></a></li>
			<%} %><% }
			 %>
	
	<li><a href="?page=<%=pageBean.nextPage()%>&filetype=<%=filetype %>">&raquo;</a></li>
</ul>
  </div>    
    </div>
    
  </body>
</html>
