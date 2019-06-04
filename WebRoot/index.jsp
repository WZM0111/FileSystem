<%@page import="common.bean.UserInfoBean"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javax.swing.Box.Filler"%>
<%@page import="common.dao.FileDao"%>
<%@page import="common.bean.FileInfoBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页面</title>
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>
<style>

body{
background-color: #F6F6F6;
}
.head0{
	width:100%;
	margin: 0 auto;
}

.log{

float:right;

}

.nav0{
	background-color:#325DA7;
	font-size:16px;
}

.nav-left{
	margin-left:15%;
	width:17.5%;
	
	font-size:16px;
	background-color:#fff;
	/*border:solid #325DA7 1px;*/
	float:left;
	
}
.nav-left a{
	color:#000;
}
.content{
	margin-right:15%;
	width:52%;
	border:2px solid #ddd;
	float:right;
	background-color:#fff;
	
	}
.form-control{
	height:50px;font-size:16px;
    border-radius:0px;}
.btn-lg {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 0px;
}
.btn {
    padding:6 px 12px;
	height:50px;
	width:100px;
    font-size: 16px;
  
    border-radius: 0px;
}
.nav0 a {
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

/* Custom Styles */
   .nav-left ul.nav-tabs{
        width: 100%;
      
        /*border-radius: 4px;*/
        border: 2px solid #ddd;
       /* box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);*/
    }
    .nav-left ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    .nav-left ul.nav-tabs li:first-child{
        border-top: none;
    }
   .nav-left  ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
   .nav-left  ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
   /*.nav-left  ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }*/
    .nav-left ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
   .nav-left  ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
	.test{
       
        font-size: 16px;
        color: blueviolet;
      padding: 3px 40px;
    }
 .pad {
    width:210px;
    margin: 0 8px 10px 0;
    text-align: center;
    height: 80px;
    color: #bbb;
    background-color: #F6F6F6;
    border-radius: 5px;
    padding: 6px 16px;
}
.content .ff {
    width: 120px;
    color:#000;
    float: left;
    text-align: left;
    margin:5px 1px 0 10px;
    font-size: 14px;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
	.ss{
		margin-left:15%;
		margin:0 auto;
		width:70%;
		}
.tablestyle{
    width:90%;
    margin:10px 10px 10px 10px;
	
}

</style>

 <script type="text/javascript">
       $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
      
      
      /*
      *显示首页
      */
      function showFirstPage()
  	{
  		document.getElementById("show").action="<%=path%>/filePageListAction?method=firstPage";
  		document.getElementById("show").submit();
  	}
    </script>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<!--头部-->

<div class="head0">
  <div style="float: right;margin-right:5%;margin-top: 5px;">
      <%
        //获取用户是否登录
        HttpSession session1=request.getSession();
      UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
     
     if(userinfo==null){
      %>
           <a href="Login.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a>
           &nbsp; &nbsp; 
           <a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a>   
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
    <table width="60%" align="center" style="float: left;margin-left: 20%">
    <tr>
    <td width="20%" align="left">
		<label for="firstname" class="col-sm-2 control-label"><img src="image/logo1.png" width="200" height="100" /></label></td>
        
        <div class="col-sm-10">
        <td width="65%">
		<br /><br />
			<input type="text" class="form-control" id="firstname"  name="content" placeholder="请输入内容">
		</td>
		</div>
        <td width="15%"><br /><br/><button type="button" class="btn btn-primary btn-lg" onclick="showFirstPage()">搜索</button></td>
       
        </tr>
        </table>
	</div>
    </form>
    
 </div>
 

<!--导航条-->

<div class="nav0">
<div class="ss">
    <ul class="nav nav-tabs nav-justified">
   
    <li class="active" ><a href="#" >主页</a>
    
    </li>
    
    <li><a href="#">分类</a></li>
    
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
<!-- 滚动时导航条固定 -->
<script type="text/javascript">
var oTop=$(".nav0").offset().top;
var marTop=$(".nav0").outerHeight();

var sTop=0;
$(window).scroll(function(){
	sTop=$(this).scrollTop();
	if(sTop>=oTop){
			
		$(".nav0").css({"position":"fixed","top":"0"});
	   $(".nav-left").css({"position":"fixed","top":marTop});
		
	$(".test").css({"margin-top":marTop});
	  $(".test").css({"padding":"32px 40px"});
	
	
		
	}
		else{
		
		$(".nav0").css({"position":"static"});
		$(".nav-left").css({"position":"static"});
		$(".test").css({"margin-top":"0"});
		 $(".test").css({"padding":"3px 40px"});
	}
});


function showFirstPage()
	{
		document.getElementById("show").action="<%=path%>/filePageListAction?method=firstPage";
		document.getElementById("show").submit();
	}
	 
</script>
<!-- 侧边导航 -->
<jsp:useBean id="filedao1" class="common.dao.impl.FileDaoImpl" scope="session"></jsp:useBean>
        <div class="nav-left" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" >
            <%
           
              List<FileInfoBean> files=filedao1.findType();
              int num=0;
              for(FileInfoBean fileinfobean:files){
            	  num++;  
            	
            %>
                <li>
                
                <a href="#section-<%=num%>">  
                <span class="glyphicon glyphicon-tasks" style="font-size: 14px; text-shadow: none;"> </span>
                 &nbsp;&nbsp;
               <%=fileinfobean.getFileType() %>
              </a>
                </li>
               <%
            	  } %>
            </ul>
        </div>
<!-- 内容区 -->
        <div class="content">
         <%
           
              List<FileInfoBean> file1s=filedao1.findType();
              int num1=0;
              for(FileInfoBean fileinfobean:file1s){
            	  num1++;  
            	
            %>
        <div class="test" id="section-<%=num1%>">
            <h3>
            <span class="glyphicon glyphicon-tasks" style="font-size: 18px; text-shadow: none; position:static; margin-top: 6px"> </span>
            <%=fileinfobean.getFileType() %></h3>
          
            <table width="100%" align="center">
                   
         
              <tr>
              
               <%
            String filetype=fileinfobean.getFileType();
             // System.out.println(filetype);
            List<FileInfoBean> filess=filedao1.findname(filetype);
            for(int i=0;i<filess.size();i++){
            	FileInfoBean filebean=filess.get(i);
            //  String fiString=encodeURIComponent()
            		//String s=URLEncoder.encode(URLEncoder.encode(filebean.getFileName()), "utf-8");
            %>
              <td  >
        
              <table class="pad" >

               <tr>
				<td>
				<!-- class="ff"  -->
				<a href="showfile.jsp?id=<%=filebean.getFileId() %>">
				<table  cellspacing="0" border="0" class="tablestyle">
					<tr>
						<td rowspan="2" width="60px">
					
								<%
													if ("doc".equals(filebean.getFileForm())
																	|| "docx".equals(filebean.getFileForm())) {
												%> <img src="image/word.png " width="60px" height="60px" />
												<%
													} else if ("xls".equals(filebean.getFileForm())
																	|| "xlsx".equals(filebean.getFileForm())) {
												%>
												    <img src="image/excel.png " width="60px" height="60px" /> <%
 	                                                } else if ("ppt".equals(filebean.getFileForm())
 					                                                || "pptx".equals(filebean.getFileForm())) {
                                                %>
												    <img src="image/ppt.png " width="60px" height="60px" /> <%
 	                                                } else if ("pdf".equals(filebean.getFileForm())) {
                                                %>
												    <img src="image/pdf.png " width="60px" height="60px" /> <%
 	                                                }%>
											
												</td>
						<td class="ff" align="left"><font size="3px"><b><%=filebean.getFileName() %></b></font>
           
            </td>
					</tr>
					<tr>
						<td class="ff"><%=filebean.getIntroduce() %>  </td>
											
									
						</tr>
                </table>
					</a>		
          
          
      </td></tr>
             
              </table> 
             
              </td>
              <%if((i+1)%3==0){%>
            	<tr></tr><%} %>
             <% }%>
              </tr>
             
            </table>
           
            
            <br>
             <p align="right"><a href="classify.jsp?filetype=<%=filetype%>">更多...</a></p>
            <hr>
            </div>
            <%} %>
           
</div>
</body>
</html>
