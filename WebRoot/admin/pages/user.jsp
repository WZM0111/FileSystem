<%@page import="common.bean.UserInfoBean"%>
<%@page import="common.bean.PageInforBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui/css/layui.css">
    <link rel="stylesheet" href="../css/scroll-bar.css">
    <link rel="stylesheet" href="../css/sub-page.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_wytlyqhtdtj1nhfr.css">
    <link rel="stylesheet" href="../lib/nprogress/nprogress.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="ok-body">
    <!--面包屑导航区域-->
    <div class="ok-body-breadcrumb">
            <span class="layui-breadcrumb">
                <a style="text-decoration:none;"><cite>首页</cite></a>
                <a style="text-decoration:none;"><cite>常用页面</cite></a>
                <a style="text-decoration:none;"><cite>用户列表</cite></a>
				<a style="text-decoration:none;"><cite>共有数据：<i id="countNum">${pageInforBean.totalNumber}</i> 条</cite></a>
            </span>
        <a style="text-decoration:none;" class="layui-btn layui-btn-small" href="../adminUserPageListAction?method=firstPage" title="刷新">
            <i class="layui-icon layui-icon-refresh"></i>
        </a>
    </div>
    <!--模糊搜索区域-->
    <div class="layui-row">
        <form class="layui-form layui-col-md12 ok-search" id="sea-form" method="post">
            <input class="layui-input" placeholder="会员开始日期" autocomplete="off" id="startTime" name="startTime" 
            	value="${startTime }">
            <input class="layui-input" placeholder="会员截止日期" autocomplete="off" id="endTime" name="endTime" 
            	value="${endTime }" >
            <input class="layui-input" placeholder="请输入用户名" autocomplete="off" id="in_username" name="in_username" 
            	value="${in_username }" >
            <a id="search" onclick="javascript:showFirstPage()"> 
            <button class="layui-btn" lay-submit="" lay-filter="search" >
                <i class="layui-icon layui-icon-search"></i>
            </button>
            </a>
        
    </div>
    <!--数据表格-->
    
    <table class="layui-table" id="tableId" lay-filter="tableFilter">
    	<thead>
        	<tr>
            	<th width="80">ID</th><th width="200">用户名</th><th width="200">用户昵称</th>
            	<th width="100">用户等级</th><th width="200">会员到期</th><th width="100">文档数量</th>
        	</tr>
       	</thead>
       	<tbody>
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
			UserInfoBean user = (UserInfoBean)currList.get(i);
			if(j%2==0){
       	%>
        <tr style="background-color: #F2F2F2">
        <%}else{%>
        <tr>
        <%} %>
            <td><%=j++ %></td>
            <td><%=user.getUser_account() %></td>
            <td><%=user.getUsername() %></td>
            <%
            if(user.getClasses().equals("1"))
            {
            %>
            	<td >会员</td>
            <%
            }else{
            %>
            	<td >普通用户</td>
            <%
            }
            %>
            <td><%=user.getVipenddate() %></td>
            <td><%=user.getUp_count() %></td>
        </tr>
        <%
		}
        %>
        </tbody>
	</table>
		<div>
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
		</div>
	</form>
</div>
<!--js逻辑-->
<script src="../lib/layui/layui.js"></script>
<script src="../lib/nprogress/nprogress.js"></script>
<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    layui.use(['element', 'table', 'form', 'jquery', 'laydate'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#startTime',
            type: "datetime"
        });

        laydate.render({
            elem: '#endTime',
            type: "datetime"
        });

        form.on('submit(search)', function () {
            layer.msg('正在查询，请稍后...');
            return false;
        });

        table.on('tool(tableFilter)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'edit') {
                layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: false,
                    maxmin: true,
                    shade: 0.5,
                    area: ['90%', '90%'],
                    content: 'user-edit.html',
                    zIndex: layer.zIndex,
                    end: function () {
                        $(".layui-laypage-btn")[0].click();
                    }
                });
            } else if (layEvent === 'del') {
                layer.confirm("确定要删除吗？", {skin: 'layui-layer-lan', icon: 2, title: '提示', anim: 6}, function () {
                    layer.msg("操作成功！", {icon: 1, time: 1000});
                });
            }
        });

        $("#batchEnabled").click(function () {
            layer.confirm("确定要批量启用吗？", {skin: 'layui-layer-lan', icon: 3, title: '提示', anim: 1}, function () {
                var checkStatus = table.checkStatus('tableId');
                var rows = checkStatus.data.length;
                if (rows > 0) {
                    var idsStr = "";
                    for (var i = 0; i < checkStatus.data.length; i++) {
                        idsStr += checkStatus.data[i].id + ',';
                    }
                    console.log("选择的id-->" + idsStr);
                    layer.msg("操作成功！", {icon: 1, time: 1000}, function () {
                        $(".layui-laypage-btn")[0].click();
                    });
                } else {
                    layer.msg('未选择有效数据', {
                        offset: 't',
                        anim: 6
                    });
                }
            });
        });

        $("#batchDisabled").click(function () {
            layer.confirm("确定要批量停用吗？", {skin: 'layui-layer-lan', icon: 3, title: '提示', anim: 2}, function () {
                var checkStatus = table.checkStatus('tableId');
                var rows = checkStatus.data.length;
                if (rows > 0) {
                    var idsStr = "";
                    for (var i = 0; i < checkStatus.data.length; i++) {
                        idsStr += checkStatus.data[i].id + ',';
                    }
                    console.log("选择的id-->" + idsStr);
                    layer.msg("操作成功！", {icon: 1, time: 1000}, function () {
                        $(".layui-laypage-btn")[0].click();
                    });
                } else {
                    layer.msg('未选择有效数据', {
                        offset: 't',
                        anim: 6
                    });
                }
            });
        });

        $("#batchDel").click(function () {
            layer.confirm("确定要批量删除吗？", {skin: 'layui-layer-lan', icon: 2, title: '提示', anim: 6}, function () {
                var checkStatus = table.checkStatus('tableId');
                var rows = checkStatus.data.length;
                if (rows > 0) {
                    var idsStr = "";
                    for (var i = 0; i < checkStatus.data.length; i++) {
                        idsStr += checkStatus.data[i].id + ',';
                    }
                    console.log("选择的id-->" + idsStr);
                    layer.msg("操作成功！", {icon: 1, time: 1000}, function () {
                        $(".layui-laypage-btn")[0].click();
                    });
                } else {
                    layer.msg('未选择有效数据', {
                        offset: 't',
                        anim: 6
                    });
                }
            });
        });

        $("#addUser").click(function () {
            layer.open({
                title: '添加用户',
                type: 2,
                shade: false,
                maxmin: true,
                shade: 0.5,
                anim: 4,
                area: ['90%', '90%'],
                content: 'user-add.html',
                zIndex: layer.zIndex,
                // skin: 'layui-layer-molv',
                end: function () {
                    $(".layui-laypage-btn")[0].click();
                }
            });
        });
    });
    
    /** 
	  *显示首页功能
	  *@author guojl   
	 */
	function showFirstPage()
	{
    	var startTime=document.getElementById("startTime").value;
    	var endTime=document.getElementById("endTime").value;
    	var in_username=document.getElementById("in_username").value;
		document.getElementById("sea-form").action="../adminUserPageListAction?method=firstPage";
		document.getElementById("sea-form").submit(); 
		//window.location.href="../adminUserPageListAction?method=firstPage&startTime="+startTime+"&endTime="+endTime+"&in_username="+in_username;
	}
	
	/**
	  * 根据页码和显示行数进行换页
	  *@author guojl
	  */
	function query(pageNo,display_rows)
	{
		var startTime=document.getElementById("startTime").value;
    	var endTime=document.getElementById("endTime").value;
    	var in_username=document.getElementById("in_username").value;
	    if(pageNo<1){
	    	alert("已经是第一页!");
	    	return false;
	    }
	    if(pageNo > '${pageInforBean.totalPage}'){
	    	alert("已经是最后一页!");
	    	return false;
	    }
	   
		document.getElementById("sea-form").action="../adminUserPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
		document.getElementById("sea-form").submit(); 
	    //window.location.href="../adminUserPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows+"&startTime="+startTime+"&endTime="+endTime+"&in_username="+in_username;
	
	}
    
    
</script>
<!--模板-->
<!--<script type="text/html" id="statusTpl">
    <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch" lay-text="启用|停用" {{ d.status== 0 ? 'checked' : ''}}>
</script>-->
</body>
</html>
