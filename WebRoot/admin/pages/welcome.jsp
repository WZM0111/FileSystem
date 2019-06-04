<%@page import="admin.dao.impl.AdminUserDaoImpl"%>
<%@page import="admin.dao.AdminUserDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ok-admin | 农夫山泉</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../css/scroll-bar.css">
    <link rel="stylesheet" href="../css/sub-page.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_hsptnwurztv.css">
</head>
<body>
<div class="ok-body">
    <blockquote class="layui-elem-quote">
        欢迎管理员：<span class="x-red">${account} </span>！当前时间: <span id="nowTime"></span> <span id="weekday"></span>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据统计</legend>
         <%
         	AdminUserDao admin=new AdminUserDaoImpl();
         %>
        <div class="layui-row layui-col-space10 layui-row-margin">
            <div class="layui-col-md2">
                <div class="layui-bg-green md2-sub1">
                    <i class="iconfont icon-dianliyonghuzongshu"></i>
                </div>
                <div class="md2-sub2">
                    <span><%=admin.userCount() %></span>
                    <cite>用户总数</cite>
                </div>
            </div>
            <div class="layui-col-md2">
                <div class="layui-bg-blue md2-sub1">
                    <i class="iconfont icon-wenzhang2"></i>
                </div>
                <div class="md2-sub2">
                    <span><%=admin.fileCount() %></span>
                    <cite>文章总数</cite>
                </div>
            </div>
            <div class="layui-col-md2">
                <div class="layui-bg-black md2-sub1">
                    <i class="iconfont icon-pinglun"></i>
                </div>
                <div class="md2-sub2">
                    <span><%=admin.commentCount() %></span>
                    <cite>评论总数</cite>
                </div>
            </div>
            <div class="layui-col-md2">
                <div class="layui-bg-orange md2-sub1">
                    <i class="iconfont icon-goods"></i>
                </div>
                <div class="md2-sub2">
                    <span><%=admin.vipCount() %></span>
                    <cite>会员总数</cite>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="layui-bg-red md2-sub1">
                    <i class="layui-icon layui-icon-rmb"></i>
                </div>
                <div class="md2-sub2">
                    <span><%=admin.incomeSum() %></span>
                    <cite>网站收益</cite>
                </div>
            </div>
         
        </div>
    </fieldset>

</div>
<!--js逻辑-->
<script src="../lib/layui/layui.js"></script>
<script>
    /**
     * 初始化函数
     */
    setDate();

    /**
     * 获取当前时间
     */
    var nowDate1 = "";
    function setDate() {
        var date = new Date();
        var year = date.getFullYear();
        nowDate1 = year + "-" + addZero((date.getMonth() + 1)) + "-" + addZero(date.getDate()) + "  ";
        nowDate1 += addZero(date.getHours()) + ":" + addZero(date.getMinutes()) + ":" + addZero(date.getSeconds());
        document.getElementById("nowTime").innerHTML = nowDate1;
        setTimeout('setDate()', 1000);
    }

    /**
     * 年月日是分秒为10以下的数字则添加0字符串
     * @param time
     * @returns {number | *}
     */
    function addZero(time) {
        var i = parseInt(time);
        if (i / 10 < 1) {
            i = "0" + i;
        }
        return i;
    }

    /**
     * 初始化星期几
     * @type {string}
     */
    var weekday = "星期" + "日一二三四五六".charAt(new Date().getDay());
    document.getElementById("weekday").innerHTML = weekday;

    layui.use('util', function () {
        var util = layui.util;
        util.fixbar({});
    });
</script>
<!--天气预报插件-->
<script>
    (function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))
</script>
<script>
    tpwidget("init", {
        "flavor": "bubble",
        "location": "WX4FBXXFKE4F",
        "geolocation": "enabled",
        "position": "top-right",
        "margin": "10px 10px",
        "language": "zh-chs",
        "unit": "c",
        "theme": "chameleon",
        "uid": "U3414DB4A9",
        "hash": "91ff44d1248d72fc847c6177474e1533"
    });
    tpwidget("show");
</script>
</body>
</html>
