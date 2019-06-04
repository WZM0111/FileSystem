<%@page import="common.bean.UserInfoBean"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>充值页面</title>
<meta charset="UTF-8">
	<title>用户充值页面</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="wangqy/js/jquery.min.js"></script>
	<link href="wangqy/bootstrap-3.3.5-dist/css/bootstrap.min.css"
		rel="stylesheet" />
	<link href="wangqy/css/dashboard.css" rel="stylesheet">
		<link href="wangqy/css/style.css" rel='stylesheet' type='text/css' />
		<link rel="stylesheet" type="text/css" href="wangqy/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="wangqy/css/main.css" />
</head>
<script src="wangqy/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="wangqy/resources/scripts/jquery-1.7.1.min.js"></script>
<script src="wangqy/resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<script src="wangqy/resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="wangqy/cz3/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="wangqy/cz3/css/main.css" />
<link rel="stylesheet" type="text/css" href="wangqy/cz2/css/main.css" />
<script type="text/javascript" src="wangqy/cz3/js/jquery.min.js"></script>
<script type="text/javascript" src="wangqy/cz3/js/amazeui.min.js"></script>
<script type="text/javascript" src="wangqy/cz3/js/ui-choose.js"></script>

<title>充值</title>
<style type="text/css">
.head0 {
	width: 60%;
	margin: 0 auto;
}

.nav0 {
	background-color: #325DA7;
	font-size: 24px;
}

.nav-left {
	margin-left: 20%;
	width: 20%;
	font-size: 16px;
	border: solid #325DA7 1px;
	float: left;
}

.nav-left1 {
	margin-left: 20%;
	float: left;
}

.nav-left a {
	color: #000;
}

.side {
	background: #666666;
	padding: 1em 30px;
}

.content {
	margin-right: 20%;
	width: 40%;
	border: solid #325DA7 1px;
	float: right;
}

.form-control {
	height: 50px;
	font-size: 18px;
	border-radius: 0px;
}

.btn-lg {
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.3333333;
	border-radius: 0px;
}

.btn {
	padding: 6 px 12px;
	height: 50px;
	width: 100px;
	font-size: 14px;
	border-radius: 0px;
}

.nav0 a {
	color: #FFF;
	text-decoration: none;
}

.nav-tabs.nav-justified>li>a {
	border-bottom: 0px;
	border-radius: 0px;
}

.nav-tabs>li>a {
	border-radius: 0px;
}

.top {
	margin-top: 5%;
}

.button01 {
	width: 164px;
	height: 50px;
	border-radius: 8px;
	background-color: darkorange;
}

.button02 {
	background-color: #666666;
	border: none;
}

.font01 {
	font-family: 幼圆;
	color: white;
}

.font02 {
	font-family: 微软雅黑;
	font-size: large;
	color: whitesmoke;
	margin-left: 10px;
}

.font03 {
	font-family: 微软雅黑;
	font-size: larger;
	color: whitesmoke;
}

.list {
	margin-left: 12px;
	margin-top: 6px;
	align-content: center;
	padding-bottom: 8px;
	padding-top: 8px;
}

ul.ui-choose>li {
	width: 120px;
	height: 80px;
	display: block;
	margin: 0;
	margin-right: 0px;
	padding: 0;
	font-size: 16px;
	line-height: 48px;
	color: #999;
	background: #fff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	cursor: pointer;
	margin-right: 30px;
	text-align: center;
	border: 2px solid #CCCCCC;
}

ul.ui-choose {
	box-sizing: border-box;
	display: inline-block;
	border: 1px solid transparent;
	font: 100 16px/30px 'microsoft yahei';
	border-right: none;
	border-bottom: none;
	font-size: 16px;
	margin: 0;
	padding: 0;
	list-style: none;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

ul.ui-choose:after {
	content: "";
	display: table;
	clear: both;
}

ul.ui-choose>li.selected {
	z-index: 3;
	border-color: #27b0d6;
	color: #27b0d6;
	background: transparent url("wangqy/images/success1.png") no-repeat right
		bottom;
}

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
.nav1 .nav .nav-tabs.nav-justified>li>a {
     border-bottom:0px;
     border-radius: 0px; 
}
.nav1 .nav-tabs>li>a {
   
    border-radius: 0px; 
}

.ss{
		margin-left:15%;
		margin:0 auto;
		width:70%;
		}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-left:10%;
    margin-bottom:5%;
    align-content: center;
}
.head1 a{
color: #337ab7;
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
                欢迎你，<a href="#" ><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=userinfo.getUser_account() %></a><br>
        
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
    <li><a href="userInformation.jsp">个人中心</a></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
  </div>
</div> 

	<!--头部-->
	<% 
		//HttpSession session1 = request.getSession();
		//UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
		String username = userinfo.getUser_account();
	%>
	<div class="container">
		<div class="top"></div>
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-9 column">
				<div class="tabbable" id="tabs-105561">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-887901" data-toggle="tab">充值中心</a>
						</li>
						<li><a href="#panel-165801" data-toggle="tab">会员充值</a></li>

					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-887901">

							<div class="pay">
								<!--主内容开始编辑-->
								<div class="tr_recharge">

									<div class="tr_rechtext">
										<p class="te_retit">
											<img src="wangqy/images/coin.png" alt="" />充值中心
										</p>

									</div>
									<form action="" class="am-form" id="doc-vld-msg" method="post">
										<div class="tr_rechbox">
											<div class="tr_rechhead">
												<img src="wangqy/images/ys_head2.jpg" />
												<p>
													充值帐户名： <input id="u18_input" type="text" value="<%=username %>"
														name="txtusername" />
												</p>
												<div class="tr_rechheadcion">
													<img src="wangqy/images/coin.png" alt="" />

												</div>
											</div>
											<div class="tr_rechli am-form-group">
												<ul class="ui-choose am-form-group"
													style="text-align: center;overflow: " id="uc_01">
													<li><label class="am-radio-inline"> <input
															type="radio" value="" name="docVlGender" required
															data-validation-message="请选择一项充值额度"><br/><font
																size="3px"><b>5个</b></font></label></li>
													<li><label class="am-radio-inline"> <input
															type="radio" name="docVlGender"
															data-validation-message="请选择一项充值额度"><br/><font
																size="3px"><b>10个</b></font></label></li>

													<li><label class="am-radio-inline"> <input
															type="radio" name="docVlGender"
															data-validation-message="请选择一项充值额度"><br/><font
																size="3px"><b>30个</b></font></label></li>

												</ul>

											</div>
											<div class="tr_rechnum">
												<span>应付金额：</span>
												<p class="rechnum">0.00元</p>
												<input id="miane" name="miane" type="hidden" value="0" />
											</div>
										</div>
										<div class="tr_paybox">
											<input type="button" value="确认支付" class="tr_pay am-btn"
												onclick="chongzhi();" /> 
										</div>
									</form>
								</div>
							</div>

						</div>
						<div class="tab-pane" id="panel-165801">
                            <div class="pay">
							<!--主内容开始编辑-->
							<div class="tr_recharge">

								<div class="tr_rechtext">
									<p class="te_retit">
										<img src="wangqy/images/coin.png" alt="" />会员充值
									</p>

								</div>
								<form action="" class="am-form" id="doc-vld-msg" method="post">
									<div class="tr_rechbox">
										<div class="tr_rechhead">
											<img src="wangqy/images/ys_head2.jpg" />
											<p>
												充值帐户名： <input id="txtusername2" type="text" value="<%=username %>"
													name="txtusername" />
											</p>
											<div class="tr_rechheadcion">
												<img src="wangqy/images/coin.png" alt="" />

											</div>
										</div>
										<div class="tr_rechli am-form-group">
											<ul class="ui-choose2 am-form-group" id="uc_02">
												<li><label class="am-radio-inline"
													style="line-height: 30px"> <input type="radio"
														value="" name="docVlGender" required
														data-validation-message="请选择一项充值额度"> <font
															size="3px"><b>一个月（￥30.0）</b></font>
															</label></li>
												<li><label class="am-radio-inline"
													style="line-height: 30px"> <input type="radio"
														name="docVlGender" data-validation-message="请选择一项充值额度"> 
															<font size="3px"><b>二个月（￥55.0）</b></font>
															</label></li>

												<li><label class="am-radio-inline"
													style="line-height: 30px"> <input type="radio"
														name="docVlGender" data-validation-message="请选择一项充值额度"> 
														<font size="3px"><b>三个月（￥75.0）</b></font>
														</label></li>

											</ul>

										</div>
										<div class="tr_rechnum">
											<span>应付金额：</span>
											<p class="rechnum">0.00元</p>
											<input id="miane2" name="miane" type="hidden" value="0" />
										</div>
									</div>
									<div class="tr_paybox">
										<input type="button" value="确认支付" class="tr_pay am-btn"
											onclick="chongzhi2();" />
									</div>
								</form>
							</div>
                            </div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>

	<script type="text/javascript">
		// 将所有.ui-choose实例化
		$('.ui-choose').ui_choose();
		// uc_01 ul 单选
		var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
		uc_01.click = function(index, item) {
			console.log('click', index, item.text())
		}
		uc_01.change = function(index, item) {
			console.log('change', index, item.text())
		}
		$(function() {
			$('#uc_01 li:eq(0)').click(function() {
				$('.tr_rechoth').show();
				$('.tr_rechoth').find("input").attr('required', 'true')
				$('.rechnum').text('5元');
				document.getElementById("miane").value = "5";

			})
			$('#uc_01 li:eq(1)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('10元');
				$('.othbox').val('');
				document.getElementById("miane").value = "10";
			})
			$('#uc_01 li:eq(2)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('30元');
				document.getElementById("miane").value = "30";
				$('.othbox').val('');
			})

			$(document).ready(function() {
				$('.othbox').on('input propertychange', function() {
					var num = $(this).val();
					$('.rechnum').html(num + ".00元");
				});
			});
		})

		$(function() {
			$('#doc-vld-msg')
					.validator(
							{
								onValid : function(validity) {
									$(validity.field).closest('.am-form-group')
											.find('.am-alert').hide();
								},
								onInValid : function(validity) {
									var $field = $(validity.field);
									var $group = $field
											.closest('.am-form-group');
									var $alert = $group.find('.am-alert');
									// 使用自定义的提示信息 或 插件内置的提示信息
									var msg = $field.data('validationMessage')
											|| this
													.getValidationMessage(validity);

									if (!$alert.length) {
										$alert = $(
												'<div class="am-alert am-alert-danger"></div>')
												.hide().appendTo($group);
									}
									$alert.html(msg).show();
								}
							});
		});
	</script>

	<script type="text/javascript">
		// 将所有.ui-choose实例化
		$('.ui-choose2').ui_choose();
		// uc_01 ul 单选
		var uc_01 = $('#uc_02').data('ui-choose'); // 取回已实例化的对象
		uc_01.click = function(index, item) {
			console.log('click', index, item.text())
		}
		uc_01.change = function(index, item) {
			console.log('change', index, item.text())
		}
		$(function() {
			$('#uc_02 li:eq(0)').click(function() {
				$('.tr_rechoth').show();
				$('.tr_rechoth').find("input").attr('required', 'true')
				$('.rechnum').text('30.0元');
				document.getElementById("miane2").value = "30.0";

			})
			$('#uc_02 li:eq(1)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('55.0元');
				$('.othbox').val('');
				document.getElementById("miane2").value = "55.0";
			})
			$('#uc_02 li:eq(2)').click(function() {
				$('.tr_rechoth').hide();
				$('.rechnum').text('75.0元');
				document.getElementById("miane2").value = "75.0";
				$('.othbox').val('');
			})

			$(document).ready(function() {
				$('.othbox').on('input propertychange', function() {
					var num = $(this).val();
					$('.rechnum').html(num + ".00元");
				});
			});
		})

		$(function() {
			$('#doc-vld-msg')
					.validator(
							{
								onValid : function(validity) {
									$(validity.field).closest('.am-form-group')
											.find('.am-alert').hide();
								},
								onInValid : function(validity) {
									var $field = $(validity.field);
									var $group = $field
											.closest('.am-form-group');
									var $alert = $group.find('.am-alert');
									// 使用自定义的提示信息 或 插件内置的提示信息
									var msg = $field.data('validationMessage')
											|| this
													.getValidationMessage(validity);

									if (!$alert.length) {
										$alert = $(
												'<div class="am-alert am-alert-danger"></div>')
												.hide().appendTo($group);
									}
									$alert.html(msg).show();
								}
							});
		});
	</script>
	<script type="text/javascript">
								function chongzhi() {
									//用户名
									var userName = $("#u18_input").val();
									var miane1 = $("#miane").val();
									$
											.post(
													"http://localhost:8080/files/cz/cz.do",
													{
														txtusername : userName,
														miane : miane1
													}, function(result) {
														alert(result);
													});

									i = 23;

								}
	</script>
	<script type="text/javascript">
								function chongzhi2() {

									//用户名
									var userName = $("#txtusername2").val();
									var miane2 = $("#miane2").val();
									$.post("/files/cz2/cz2.do", {
										txtusername : userName,
										miane : miane2
									}, function(result) {
										alert(result);
									});

								}
	</script>
	<body>
	</body>
</html>
