<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login/regist</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />
<link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet" />
<link href="data/styles.css" type="text/css" rel="stylesheet" />
<link href="files/login_regist/styles.css" type="text/css" rel="stylesheet" />
<script src="resources/scripts/jquery-1.7.1.min.js"></script>
<script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
<script src="resources/scripts/prototypePre.js"></script>
<script src="data/document.js"></script>
<script src="resources/scripts/prototypePost.js"></script>
<script src="files/login_regist/data.js"></script>
<script type="text/javascript">
var flag1 = false;//用户账号已存在
$(function() {
	
	//焦点离开时触发事件  
    $("#u16_input").change(function(){    
        var new_user_account = $("#u16_input").val();
        console.log(new_user_account)
        $.ajax({  
            type : "GET",  
            url : "<%=path%>/userlogin?method=acc_if_exist",
				data : {
					account : new_user_account,
				},
				dataType : "text",
				success : function(msg) {
					console.log(msg)
					setMsg(msg);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});

		});

		function setMsg(msg) {
			var reg_acc_msg = $("#reg_acc_msg");
			if ($.trim(msg) == "true") {
				reg_acc_msg.css("color", "red");
				reg_acc_msg.text("该用户账号已存在");
				flag1=false;
			} else {
				reg_acc_msg.css("color", "gray");
				reg_acc_msg.text("");
				flag1 = true;
			}
		}
		
	});
	
	$axure.utils.getTransparentGifPath = function() {
		return 'resources/images/transparent.gif';
	};
	$axure.utils.getOtherPath = function() {
		return 'resources/Other.html';
	};
	$axure.utils.getReloadPath = function() {
		return 'resources/reload.html';
	};
	
	$(function(){
		$('.ok').hide();
		$('.rem').click(function(){
			$(this).toggleClass('selected');
		});

		$('#signup_select').click(function(){
			$('.form_row ul').show();
			event.cancelBubble = true;
		});

		$('#d').click(function(){
			$('.form_row ul').toggle();
			event.cancelBubble = true;
		});

		$('body').click(function(){
			$('.form_row ul').hide();
		});

		$('.form_row li').click(function(){
			var v  = $(this).text();
			$('#signup_select').val(v);
			$('.form_row ul').hide();
		});

		$('#u6_input').blur(function() {
			if($(this).val().length>0) {
				$('.ok').show();
			} else {
				$('.ok').hide();
			}
			if(!isPlaceholder()){
				if($("#u6_input").val()==""){
					$("#u6_input").val($("#u6_input").attr("placeholder"));
				}
			}
		});

		$('#u6_input').focus(function() {
			if(!isPlaceholder()){
				if($(this).val()==$(this).attr("placeholder")){
					$(this).val("");
				}
			}
		});
		
		$('#u6_input').blur(function() {
			let u6_val = $('#u6_input').val();
			if(u6_val == null || u6_val == '')
				$('#msg_acc').text('用户名不能为空');
			else
				$('#msg_acc').text('');
		});
		
		$('#u7_input').blur(function() {
			let u7_val = $('#u7_input').val();
			if(u7_val == null || u7_val == '')
				$('#msg_pswd').text('密码不能为空');
			else
				$('#msg_pswd').text('');
		});
	
		$('#u16_input').blur(function() {
			let u16_val = $('#u16_input').val();
			if(u16_val == null || u16_val == '')
			{
				document.getElementById("reg_acc_msg").style.color="red";
				$('#reg_acc_msg').text('用户账号不能为空');
			}else if(flag1 == false){
				document.getElementById("reg_acc_msg").style.color="red";
				document.getElementById("reg_acc_msg").innerText = "该用户账号已存在";
			}
			else
				$('#reg_acc_msg').text('');
		});//注册账户文本框
		
		$('#u17_input').blur(function() {
			let u17_val = $('#u17_input').val();
			if(u17_val == null || u17_val == '')
			{
				document.getElementById("reg_pswd_msg").style.color="red";
				$('#reg_pswd_msg').text('密码不能为空');
			}
			else
				$('#reg_pswd_msg').text('');
		});//注册密码文本框
		
		$('#u21_input').blur(function() {
			let u17_val = $('#u17_input').val();
			let u21_val = $('#u21_input').val();
			if(u21_val == null || u21_val == ''|| u21_val!=u17_val)
			{
				$('#reg_conpswd_msg').text('两次密码不相等');
			}
			else
				$('#reg_conpswd_msg').text('');
		});//确认密码文本框
	});
	
	//判断浏览器是否支持 placeholder属性
	function isPlaceholder(){
		var input = document.createElement('input');
		return 'placeholder' in input;
	}

	if (!isPlaceholder()) {//不支持placeholder 用jquery来完成
		$(document).ready(function() {
			if(!isPlaceholder()){
				$("input").not("input[type='password']").each(//把input绑定事件 排除password框
					function(){
						if($(this).val()=="" && $(this).attr("placeholder")!=""){
							$(this).val($(this).attr("placeholder"));
							$(this).focus(function(){
								if($(this).val()==$(this).attr("placeholder")){
									$(this).val("");
								}
							});
							$(this).blur(function(){
								if($(this).val()==""){
									$(this).val($(this).attr("placeholder"));
								}
						});
					}
				});

				//对password框的特殊处理1.创建一个text框 2获取焦点和失去焦点的时候切换
				var pwdField = $("input[type=password]");
				var pwdVal = pwdField.attr('placeholder');
				pwdField.after('<input id="pwdPlaceholder" type="text" value='+pwdVal+' autocomplete="off" />');
				var pwdPlaceholder = $('#pwdPlaceholder');
				pwdPlaceholder.show();
				pwdField.hide();

				pwdPlaceholder.focus(function(){
					pwdPlaceholder.hide();
					pwdField.show();
					pwdField.focus();
				});

				pwdField.blur(function(){
					if(pwdField.val() == '') {
						pwdPlaceholder.show();
						pwdField.hide();
					}
				});
			}
		});
	}
	
	
	function login_check() {
		var sname = document.getElementById("u6_input").value;
		var pass = document.getElementById("u7_input").value;
	
		if (sname == "" || sname == "请输入用户账号") {
			//document.getElementById("msg_acc").innerText = "用户名不能为空";
			return false;
		} else if (pass == ""|| pass == "请输入密码") {
			//document.getElementById("msg_pswd").innerText = "密码不能为空";
			return false;
		}
		return true;
	}
	
	function login1() {
		 if(login_check()){
			  document.loginForm.action="<%=path%>/userlogin?method=login";
			  document.loginForm.submit();
			  return true;
		 }
	}
	
	function reg_check() {
		var new_user_account = document.getElementById("u16_input").value;
		//var reg_acc_msg = document.getElementById("reg_acc_msg").value;
		var new_pass = document.getElementById("u17_input").value;
		var new_con_pass = document.getElementById("u21_input").value;
		
		if (new_user_account == "" || new_user_account == "新用户"||flag1 == false) {
			
			return false;
		}else if (new_pass == ""|| new_pass == "请输入密码") {
			//document.getElementById("msg_pswd").innerText = "密码不能为空";
			return false;
		}else if (new_con_pass == ""|| new_con_pass != new_pass) {
			return false;
		}
		return true;
	}
	
	function regist() {
		 if(reg_check()){
			  document.registForm.action="<%=path%>/userlogin?method=regist";
			  document.registForm.submit();
			  return true;
		 }
	}
</script>
</head>
<body style="background:rgba(0,0,0, .2) url(images/login_regist/3.jpg) no-repeat center center; background-size:cover">
	<!-- <img src="images/login_regist/sdnu.png" style="" /> -->
	<div id="base" class="">

		<!-- Unnamed (矩形) -->
		<div id="u0" class="ax_default box_1" style="background:rgba(255,255,255, .9)">
			<div id="u0_div" class=""></div>
		</div>

		<!-- login/regist (动态面板) -->
		<div id="u1" class="ax_default" data-label="login/regist">
			<div id="u1_state0" class="panel_state" data-label="login" style="">
				<div id="u1_state0_content" class="panel_state_content">

					<!-- Unnamed (矩形) -->
					<div id="u2" class="ax_default label">
						<div id="u2_div" class=""></div>
						<div id="u2_text" class="text ">
							<p>
								<span>登录</span>
							</p>
						</div>
					</div>

					<!-- Unnamed (矩形) -->
					<div id="u3" class="ax_default label">
						<div id="u3_div" class=""></div>
						<div id="u3_text" class="text ">
							<p>
								<span>注册</span>
							</p>
						</div>
					</div>

					<!-- Unnamed (水平线) -->
					<div id="u4" class="ax_default line" selectiongroup="登录1">
						<img id="u4_img" class="img " src="images/login_regist/u4.png" />
					</div>

					<!-- Unnamed (水平线) -->
					<div id="u5" class="ax_default line">
						<img id="u5_img" class="img " src="images/login_regist/u5.png" />
					</div>
					<form action="" name="loginForm" method="post">
						<!-- Unnamed (文本框) -->
						<div id="u6" class="ax_default text_field">
							<input id="u6_input" type="text" name="user_account" data-required="required" placeholder="请输入用户账号" value="${user_acc }" maxlength="30" />
							
						</div>
						
						<!-- Unnamed (文本框) -->
						<div id="u7" class="ax_default text_field">
							<input id="u7_input" type="password" name="password" data-required="required" placeholder="请输入密码" value="" />
						</div>

						<!-- Unnamed (矩形) -->
						<a href='javascript:login1()' onclick="">
						<div id="u8" class="ax_default button">
							<div id="u8_div" class=""></div>
							<div id="u8_text" class="text ">
								<p>
									<span>登录</span>
								</p>
							</div>
						</div>
						</a>
					</form>
					<!-- Unnamed (矩形) -->
					<div id="u9" class="ax_default label">
						<div id="u9_div" class=""></div>
						<div id="u9_text" class="text ">
							<p>
								<span>忘记密码?</span>
							</p>
						</div>
					</div>

					<!-- Unnamed (热区) -->
					<div id="u10" class="ax_default"></div>

					<!-- Unnamed (矩形) -->
					<div id="u11" class="ax_default label">
						<div id="u11_div" class="">
							<p>
								<span id="msg_acc" style="color: red;font-size:12px"></span>
							</p>
						</div>
					</div>

					<!-- Unnamed (矩形) -->
					<div id="u12" class="ax_default label">
						<div id="u12_div" class="">
							<p>
								<span id="msg_pswd" style="color: red;font-size:12px">${errMsg }</span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="u1_state1" class="panel_state" data-label="regist"
				style="visibility: hidden;">
				<div id="u1_state1_content" class="panel_state_content">

					<!-- Unnamed (矩形) -->
					<div id="u13" class="ax_default label" selectiongroup="登录">
						<div id="u13_div" class=""></div>
						<div id="u13_text" class="text ">
							<p>
								<span>登录</span>
							</p>
						</div>
					</div>

					<!-- Unnamed (矩形) -->
					<div id="u14" class="ax_default label" selectiongroup="注册">
						<div id="u14_div" class=""></div>
						<div id="u14_text" class="text ">
							<p>
								<span>注册</span>
							</p>
						</div>
					</div>

					<!-- Unnamed (水平线) -->
					<div id="u15" class="ax_default line">
						<img id="u15_img" class="img " src="images/login_regist/u15.png" />
					</div>
				<form action="" name="registForm" method="post">
					<!-- Unnamed (文本框) -->
					<div id="u16" class="ax_default text_field">
						<input id="u16_input" name="new_user_account" type="text" data-required="required" placeholder="新用户" value="" />
					</div>

					<!-- Unnamed (文本框) -->
					<div id="u17" class="ax_default text_field">
						<input id="u17_input" name="pswd" type="password" data-required="required" placeholder="请输入密码" value="" />
					</div>

					<!-- Unnamed (文本框) -->
					<div id="u21" class="ax_default text_field">
						<input id="u21_input" name="con_pswd" type="password" data-required="required" placeholder="确认密码" value="" />
					</div>
					
					<!-- Unnamed (矩形) -->
					<a href='javascript:regist()' onclick="">
					<div id="u18" class="ax_default button">
						<div id="u18_div" class=""></div>
						<div id="u18_text" class="text ">
							<p>
								<span>注册</span>
							</p>
						</div>
					</div>
					</a>
				</form>
					<!-- Unnamed (水平线) -->
					<div id="u19" class="ax_default line" selectiongroup="注册1">
						<img id="u19_img" class="img " src="images/login_regist/u4.png" />
					</div>

					<!-- Unnamed (热区) -->
					<div id="u20" class="ax_default"></div>

					<!-- Unnamed (矩形) -->
					<div id="u22" class="ax_default label">
						<div id="u22_div" class="">
						<span id="reg_acc_msg" style="color: gray;font-size:12px">6~12位字符或数字，不能使用空格</span>
						</div>
					</div>

					<!-- Unnamed (矩形) -->
					<div id="u23" class="ax_default label">
						<div id="u23_div" class="">
						<span id="reg_pswd_msg" style="color: gray;font-size:12px">6~12位字符或数字，不能使用空格</span>
						</div>
					</div>

					<!-- Unnamed (矩形) -->
					<div id="u24" class="ax_default label">
						<div id="u24_div" class="">
						<span id="reg_conpswd_msg" style="color: red;font-size:12px"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
