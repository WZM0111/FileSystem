<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String admin_login=(String)session.getAttribute("admin_login");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>admin | 悦读的后台模版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../css/okadmin.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_ciewkz7d5vo.css">
    <link rel="stylesheet" href="../lib/nprogress/nprogress.css">
    <script type="text/javascript">
    
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!--头部导航-->
    <div class="layui-header">
        <div class="layui-logo">admin 悦读</div>
        <div class="menu-switch">
            <i class="iconfont icon-caidan"></i>
        </div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this"><a href=""><i class="iconfont icon-jiankongkongzhiguanlijianguan"></i> 控制管理<span class="layui-badge-dot"></span></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="../images/head.jpg" class="layui-nav-img">
                    ${account }
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void(0)" id="lock">锁定账户</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0)" id="logout">退出</a></li>
        </ul>
    </div>
    <!--左侧导航区域-->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">
                        <i class="layui-icon">&#xe62a;</i> 常用页面
                    </a>

                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" path="../adminUserPageListAction?method=firstPage" tab-id="1-1"><i class="iconfont icon-dianliyonghuzongshu"></i> 用户列表</a></dd>
                        <dd><a href="javascript:;" path="../adminFilesPageListAction?method=firstPage" tab-id="1-2"><i class="iconfont icon-wenzhang2"></i> 文章审核</a></dd>
						<!-- <dd><a href="javascript:;" path="../adminIncomePageListAction?method=firstPage" tab-id="1-11"><i class="layui-icon layui-icon-rmb"></i> 收益列表</a></dd> -->
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 内容主体区域 -->
    <div class="content-body">
        <div class="layui-tab layui-tab-brief" lay-filter="ok-tab" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this"><i class="layui-icon">&#xe68e;</i> 控制台</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src="welcome.jsp" frameborder="0" scrolling="yes" width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!--底部信息-->
    <div class="layui-footer">
        悦读网络
        <button class="layui-btn layui-btn-danger layui-btn-xs">农夫山泉</button>
    </div>
</div>
<div class="yy"></div>
<!--js逻辑-->
	<script src="../lib/layui/layui.js"></script>
	<script src="../lib/nprogress/nprogress.js"></script>
	<script src="../js/okadmin.js"></script>
</body>
</html>