<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.removeAttribute("admin_login");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ok-admin | 很赞的后台模版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="ok-admin v1.0,ok-admin网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="ok-admin v1.0，顾名思义，很赞的后台模版，它是一款基于Layui框架的轻量级扁平化且完全免费开源的网站后台管理系统模板，适合中小型CMS后台系统。">
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../lib/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_ask70l8wanw.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css"/>
    <link rel="stylesheet" href="../css/login.css"/>
	<link rel="stylesheet" href="../lib/nprogress/nprogress.css">
</head>
<body>
    <div class="login-box animated rotateIn">
        <div class="head"></div>
        <div class="input-box">
            <form class="layui-form" method="post" id="login_form">
                <input type="text" name="username" required lay-verify="required" placeholder="管理员账号" autocomplete="off" class="layui-input">
                <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
                <br>
                <input type="submit" value="登 录" lay-submit lay-filter="login">
            </form>
            <div class="oauth">
                <%
	String errMsg=(String)session.getAttribute("errMsg");
	session.removeAttribute("errMsg");
	if(errMsg==null){
		errMsg="";
	}else{
	%>
	<p>
		<span id="msg_pswd" style="color: red;font-size:12px"><%=errMsg %></span>
	</p>
	<% }%>
            </div>
        </div>
        <div class="copyright">
            © 2018-2019 ok-admin. All rights reserved.
        </div>
    </div>
    <!--js逻辑-->
    <script src="../lib/layui/layui.js"></script>
	<script src="../lib/nprogress/nprogress.js"></script>
    <script>
		NProgress.start();
		window.onload = function() {
		    NProgress.done();
		}
        layui.use(['form', 'jquery'], function () {
            var form = layui.form;
            var $ = layui.jquery;

            form.on('submit(login)', function (data) {
                layer.msg("登陆中...", {icon: 6, time: 1000, anim: 4}, function () {
                	document.getElementById("login_form").action="../adminLoginAction?method=login";
            		document.getElementById("login_form").submit();
                });
                return false;
            });
        });
    </script>
</body>
</html>