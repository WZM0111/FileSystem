<%@page import="common.bean.FileInfoBean"%>
<%@page import="common.dao.impl.FileDaoImpl"%>
<%@page import="common.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@page import="common.bean.PageInforBean"%>
<%@page import="common.utils.ConnectionPool"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="common.bean.UserInfoBean"%>
<%@page import="java.net.URLEncoder"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>find</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    
     <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
     <script type="text/javascript" src="js/jquery.min.js"></script>
     <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>

    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/find/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/find/data.js"></script>
    
   
<style type="text/css">
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
.head1 a{
color: #337ab7;
}
</style>
    <script type="text/javascript">
      
      /*
      *显示首页
      */
      function showFirstPage()
  	{
  		document.getElementById("show").action="<%=path%>/filePageListAction?method=firstPage";
  		document.getElementById("show").submit();
  	}
 	 

      /*
       *判断
       */
      function query(pageNo,display_rows)
  	{
 
      	//var type=document.getElementById("typeid").value;
  	    if(pageNo<1){
  	    	alert("已经是第一页!");
  	    	return false;
  	    }
  	    if(pageNo > '${pageInforBean.totalPage}'){
  	    	alert("已经是最后一页!");
  	    	return false;
  	    }
  	  	document.getElementById("show").action="<%=path%>/filePageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
		document.getElementById("show").submit();
  	    //window.location.href="../filePageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
  	}
      function showFirstPage()
      {
      	document.getElementById("show").action="<%=path%>/filePageListAction?method=firstPage";
      	document.getElementById("show").submit();
      }
    </script>
  </head>
  <body >
    




	
   	 


	<form class="form-horizontal" role="form" action="#" id="show" method="post">
	  <div id="u33" class="ax_default box_1">

     
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
         
	<div class="form-group">
    <table width="60%" align="center" style="float: left;margin-left: 20%"><tr><td width="20%" align="left">
		<label for="firstname" class="col-sm-2 control-label"><a href="index.jsp"><img src="./image/logo1.png" width="200" height="100" /></a></label></td>
        
        <div class="col-sm-10"><td width="65%">
		<br /><br />
			<input type="text" class="form-control" id="firstname" name="content" placeholder="请输入内容" value="${content}">
		</td></div>
        <td width="15%"><br /><br /><button type="button" class="btn btn-primary btn-lg" onclick="showFirstPage()" >搜索</button>
        
        </td>
        </tr>
        </table>
	</div>

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
              List<FileInfoBean> listfiles=filedao1.findType();
              for(FileInfoBean fileinfobean:listfiles){     	
            %>
                    <li><a href="classify.jsp?filetype=<%=fileinfobean.getFileType() %>"><%=fileinfobean.getFileType() %></a></li>
                    <%
            	  } %>
                    
                </ul>
    </li>
    <li><a href="#">关于我们</a></li>
    <li><a href="userInformation.jsp">个人中心</a></li>
    <li></li>
    <li></li>
    <li></li>
<li></li>
  </ul>
  </div>
</div> 
     
     </div>
     
     
     
     <div   style="margin-left:200px ;margin-top:150px;overflow:auto;float:left;border: 1px solid #eee" >
      <!-- Unnamed (矩形) -->
      <div id="u0" class="ax_default label">
        <div id="u0_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- <!-- Unnamed (矩形) -->
      <div id="u2" class="ax_default label">
        <div id="u2_div" class=""></div>
       
        <div id="u3" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u4" class="ax_default label">
        <div id="u4_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u5" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u6" class="ax_default label">
        <div id="u6_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u7" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u8" class="ax_default label">
        <div id="u8_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u9" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u10" class="ax_default label">
        <div id="u10_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u11" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
      
       

      <!-- Unnamed (图片) -->
      <div id="u20" class="ax_default image">
        <img id="u20_img" class="img " src="images/find/u20.PNG"/>
        <!-- Unnamed () -->
        <div id="u21" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (图片) -->
      <div id="u22" class="ax_default image">
        <img id="u22_img" class="img " src="images/find/u22.PNG"/>
        <!-- Unnamed () -->
        <div id="u23" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (图片) -->
      <div id="u24" class="ax_default image">
        <img id="u24_img" class="img " src="images/find/u24.PNG"/>
        <!-- Unnamed () -->
        <div id="u25" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (图片) -->
      <div id="u26" class="ax_default image">
        <img id="u26_img" class="img " src="images/find/u26.PNG"/>
        <!-- Unnamed () -->
        <div id="u27" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (图片) -->
      <div id="u28" class="ax_default image">
        <img id="u28_img" class="img " src="images/find/u28.PNG"/>
        <!-- Unnamed () -->
        <div id="u29" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
          

    <div id="u50" class="ax_default _文本段落">
        <div id="u50_div" class=""></div>
        <div id="u51" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
      <div id="u52" class="ax_default button" data-label="lppt">
       
        <div id="u53" class="text">
          <input type="hidden" name="form" value="ppt" />
         <a href="<%=path%>/filePageListAction?content1=${content}&action=ppt&method=firstPage"  ><p><span>PPT格式</span></p></a> 
         </div>
      </div>


     
      <div id="u54" class="ax_default _文本段落">
        <div id="u54_div" class=""></div>
        <div id="u55" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
      <div id="u56" class="ax_default button" data-label="lxls">
        <div id="u57" class="text">
          <input type="hidden" name="form" value="xls" />
          <a href="<%=path%>/filePageListAction?content1=${content}&action=xls&method=firstPage" ><p><span>XLS格式</span></p></a>
        </div>
      </div>

     
     <div id="u42" class="ax_default button" data-label="lpdf">
        <div id="u43" class="text" >
          <input type="hidden" name="form" value="pdf" />
          <a href="<%=path%>/filePageListAction?content1=${content}&action=pdf&method=firstPage"  onclick="showFirstPage()" ><p><span>PDF格式</span></p></a>
        </div>
      </div>


      <div id="u46" class="ax_default _文本段落">
        <div id="u46_div" class=""></div>
        <div id="u47" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
      <div id="u48" class="ax_default button" data-label="ldoc">
        <div id="u49" class="text">
           <input type="hidden" name="form" value="doc" />
          <a href="<%=path%>/filePageListAction?content1=${content}&action=doc&method=firstPage"  ><p><span>DOC格式</span></p></a>
        </div>
      </div>
     
     
      <div id="u44" class="ax_default button" data-label="lall">
        <div id="u45" class="text"> 
          <input type="hidden" name="form" />
          <a href="<%=path%>/filePageListAction?content1=${content}&action=all&method=firstPage"  onclick="showFirstPage()" ><p><span>全部格式</span></p></a>
        </div>
      </div>
       
      <div id="u60" class="ax_default button" data-label="ltxt">
        
   
            <%
	    	String c=(String)session.getAttribute("content");
	    	FileDao file=new FileDaoImpl();	
	    	List<FileInfoBean> fs=file.filetypes(c);
   	 		%>
	    	<table style="font-size: 16px">
	    	<tr><th style="font-size: 18px">相关搜索</th></tr>
	    	<%
	    		for(FileInfoBean files: fs) {	    	
	    	%>
	 	   	<%-- <tr>
	 	   	<td><a href="<%=path%>/relativeAction?types=<%=files.getFileType()%>&method=firstPage"  >
	 	   	<%=files.getFileType()%></a></td>
	 	   	</tr> --%>
	 	   	<tr>
	 	   	<td><a href="<%=path%>/relativeAction?types=<%=files.getFileName()%>&method=firstPage"  >
	 	   	<%=files.getFileName()%></a></td>
	 	   	</tr>
	    	<%
	    		}
	    	%>
	    	</table>
        </div>
      </div>	
   
      
 	
     
   
       <div  style="margin-left:200px ;margin-top:20px;overflow:auto;float:left;border: 1px solid #eee;width: 700px;background-color: #FFFFFF" > 
    	<table align="center" style="margin-top:50px;font-size: 16px">
	    	<%
	       	PageInforBean listBean = (PageInforBean)session.getAttribute("pageInforBean");
		    List currList = new ArrayList();
		    int totalPage = 0; //总页数
			if (listBean != null) {
				currList = listBean.getList(); //获取当前页面显示列表集合
				totalPage = listBean.getTotalPage(); //获取总页数
			}
		    int j=1;
		    int size=currList.size();
			for (int i = 0; i < currList.size(); i++) {
				FileInfoBean f = (FileInfoBean)currList.get(i);			
	       	%>
	        
            <tr><td><a href="<%=path%>/showfile.jsp?id=<%=f.getFileId()%>"><%=f.getFileName()%></a></td></tr>
	    	<tr><td colspan="2" ><font size="-1"><%=f.getIntroduce()%></font></td></tr>
	    	<td><%=f.getUsername()%></td>
	    	<td><%=f.getUploadDate()%></td>  
	    	<td>下载量：<%=f.getDownloadnum()%></td>
	    	<td>格式：<%=f.getFileForm()%></td>
	    	</tr>
	    	<tr><td style="width:600px " colspan="4"><hr></td></tr>
	    	
	        <%
			}
	        %>
		</table>
		
		<div><center>
			<ul class="pagination">
				<li><a href="javascript:void(0)"
					onclick="query(${pageInforBean.currentPage-1},${pageInforBean.showCount })">&laquo;</a>
				</li>
				<%
					for (int i = 1; i <= totalPage; i++) {
						
				%>
				<li class='<%=(i == listBean.getCurrentPage() ? "active" : "")%>'><a
					href="javascript:query(<%=i%>,${pageInforBean.showCount } )"><%=i%></a>
				</li>
				<%
					}
				%>
				<li><a href="javascript:void(0)"
					onclick="query(${pageInforBean.currentPage+1 },${pageInforBean.showCount })">&raquo;</a>
				</li>
				<li><span>(${pageInforBean.fromCount}-${pageInforBean.fromCount+pageInforBean.showCount-1}/${pageInforBean.totalNumber})</span>
				</li>
			</ul>
			<ul class="pagination">
				<li><span>显示条数&nbsp;:&nbsp;</span></li>
				<li class="<%=(10 == listBean.getShowCount() ? "active" : "")%>"><a
					href="javascript:query(1,10)">10</a></li>
				<li class="<%=(30 == listBean.getShowCount() ? "active" : "")%>"><a
					href="javascript:query(1,30)">30</a></li>
				<li class="<%=(50 == listBean.getShowCount() ? "active" : "")%>"><a
					href="javascript:query(1,50)">50</a></li>
			</ul>
			</center>
		</div>
	</div>
   
   </form>
    
      
    </div>
  </body>
</html>
