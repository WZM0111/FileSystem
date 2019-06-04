<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
  <head>
    <title>充值页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/index/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>

    
<style type="text/css">
.head0{
	width:60%;
	margin: 0 auto;
	}
.nav0{
	background-color:#9C3;
	font-size:24px;
	}
.form-control{height:50px;font-size:18px;}
</style>
    

<script type="text/javascript">
	 function check(browser)
	 {
		  document.getElementById("shoujia").value=browser +"元";
	 }
	 
	 function login1() {
		document.getElementById('czForm').action ="<%=path%>/cz/cz.do";		 
		document.getElementById('czForm').submit();		
	}
	
</script>
<script type="text/javascript">
	 function mycheck()
	 {
		  return true;
	 }
 
 
</script>
</head>
<body>
  
  <div id="daohangdiv">
  <div class="head0">

	<div class="form-group">
    <table width="100%"><tr><td width="200" align="right">
		<label for="firstname" class="col-sm-2 control-label"><img src="../logo1.png" width="200" height="100" /></label></td>
        
        <div class="col-sm-10"><td>
		<br /><br />
			<input type="text" class="form-control" id="firstname" height="300"
				   placeholder="请输入名字">
		</td></div>
        </tr>
        </table>
	</div>
</div>
<div class="nav0">
    <ul class="nav nav-tabs nav-justified">
    <li class="active" ><a href="#">Home</a></li>
    <li><a href="#">SVN</a></li>
    <li><a href="#">iOS</a></li>
    <li><a href="#">VB.Net</a></li>
    <li><a href="#">Java</a></li>
    <li><a href="#">PHP</a></li>
 </ul>
 </div>  
  
  
   </div>
    <div id="base" class="">

      <!-- Unnamed (矩形) -->
      <div id="u0" class="ax_default box_1">
        <div id="u0_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u2" class="ax_default _一级标题">
        <div id="u2_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u3" class="text" style="visibility: visible;">
          <p><span>充值中心</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u4" class="ax_default label">
        <div id="u4_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u5" class="text" style="visibility: visible;">
          <p><span>充值类型：</span></p>
        </div>
      </div>
<form  id ="czForm" method="post" >
      <!-- Unnamed (矩形) -->
      <div id="u6" class="ax_default label">
        <div id="u6_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u7" class="text" style="visibility: visible;">
          <p><span>用户名：&nbsp;&nbsp; </span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u8" class="ax_default label">
        <div id="u8_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u9" class="text" style="display: none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u10" class="ax_default label">
        <div id="u10_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u11" class="text" style="visibility: visible;">
          <p><span>充值面额：</span></p>
        </div>
      </div>

      <!-- Unnamed (单选按钮) -->
      <div id="u12" class="ax_default radio_button">
       
        <input id="u12_input" type="radio" value="5" name="miane"  onclick="check(this.value)"/>
        <label for="u12_input">

          <div id="u13" class="text" style="visibility: visible;">
            <p><span>5个</span></p>
          </div>
        </label>
       
      </div>

      <!-- Unnamed (单选按钮) -->
      <div id="u14" class="ax_default radio_button">
        <label for="u14_input">
          <!-- Unnamed () -->
          <div id="u15" class="text" style="visibility: visible;">
            <p><span>10个</span></p>
          </div>
        </label>
        <input id="u14_input" type="radio" value="10" name="miane" onclick="check(this.value)"/>
      </div>

      <!-- Unnamed (单选按钮) -->
      <div id="u16" class="ax_default radio_button">
        <label for="u16_input">
          <!-- Unnamed () -->
          <div id="u17" class="text" style="visibility: visible;">
            <p><span>30个</span></p>
          </div>
        </label>
        <input id="u16_input" type="radio" value="30" name="miane" onclick="check(this.value)"/>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u18" class="ax_default text_field">
        <input id="u18_input" type="text" value="" name="txtusername"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u19" class="ax_default label">
        <div id="u19_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u20" class="text" style="visibility: visible;">
          <p><span>充值豆</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u21" class="ax_default label">
        <div id="u21_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u22" class="text" style="visibility: visible;">
          <p><span>售价：&nbsp;&nbsp; </span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u23" class="ax_default label">
        <div id="u23_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u24" class="text" style="visibility: visible;">
          <input id="shoujia" type="text" value="5元"    class="text" readonly="true"/>
         
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u25" class="ax_default primary_button">
        <div id="u25_div" class=""></div>
        <!-- Unnamed () -->
        <input type="submit" name="Submit" value="注 册" onClick=" return mycheck();">
        <div id="u26" class="text" style="visibility: visible;" onclick ="login1();">
        
          <p><span>立即充值</span></p>
        </div>
      </div>
      </form>
      
    </div>
  </body>
</html>
