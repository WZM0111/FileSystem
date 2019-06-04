<%@page import="common.bean.PageInforBean"%>
<%@page import="admin.bean.AdminIncomeBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收益页面</title>
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
			<a><cite>首页</cite></a> 
			<a><cite>常用页面</cite></a> 
			<a><cite>收益列表</cite></a> 
		</span> 
		<a class="layui-btn layui-btn-small" href="../adminIncomePageListAction?method=firstPage" title="刷新"> 
			<em class="layui-icon layui-icon-refresh"></em>
		</a>
	</div>
	
	<!--模糊搜索区域-->
    <div class="layui-row">
        <form class="layui-form layui-col-md12 ok-search" id="sea-form" method="post">
				<input class="layui-input" placeholder="开始日期" autocomplete="off"
					id="startTime" name="startTime" value="${startTime }">
				<input class="layui-input" placeholder="截止日期" autocomplete="off"
					id="endTime" name="endTime" value="${endTime }">
				<input class="layui-input" placeholder="上传者" autocomplete="off"
					id="in_upuser" name="in_upuser" value="${in_upuser}">
				<a id="search" onclick="javascript:showFirstPage()">
					<button class="layui-btn" lay-submit="" lay-filter="search">
						<i class="layui-icon layui-icon-search"></i>
					</button>
				</a>
    </div>
	<br>
    <table class="layui-table" id="tableId"  >
    <thead>
					<tr>
						<th width="80">ID</th>
						<th width="150">用户</th>
						<th width="150">文件标题</th>
						<th width="150">上传者</th>
						<th width="100">金额</th>
						<th width="200">下载时间</th>
						<th width="100">备注</th>
					</tr>
				</thead>
				<tbody>
					<%
						PageInforBean listBean = (PageInforBean) session.getAttribute("pageInforBean");
						List currList = new ArrayList();
						int totalPage = 0; //总页数
						if (listBean != null) {
							currList = listBean.getList(); //获取当前页面显示列表集合
							totalPage = listBean.getTotalPage(); //获取总页数
						}
						int j = 1;
						int size = currList.size();
						for (int i = 0; i < currList.size(); i++) {
							AdminIncomeBean income = (AdminIncomeBean) currList.get(i);
							if (j % 2 == 0) {
					%>
					<tr style="background-color: #F2F2F2">
						<%
							} else {
						%>
					
					<tr>
						<%
							}
						%>
						<td><%=j++%></td>
						<td><%=income.getDown_user()%></td>
						<td><%=income.getFilename()%></td>
						<td><%=income.getUp_user()%></td>
						<td><%=income.getMoney()%></td>
						<td><%=income.getDowntime()%></td>
						<td>
						<%
						if(income.getIs_vip()==1)
						{
						%>
							<button class="layui-btn layui-btn-sm" name="top" >充值会员</button>
						<%
						}else{} 
						%>
						</td>
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
    }
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
	});
    
    /** 
	  *显示首页功能
	  *@author guojl   
	 */
	function showFirstPage()
	{
		document.getElementById("sea-form").action="../adminIncomePageListAction?method=firstPage";
		document.getElementById("sea-form").submit();
		//window.location.href="../adminIncomePageListAction?method=firstPage&startTime="+startTime+"&endTime="+endTime+"&in_upuser="+in_upuser;
	}
	
	/**
	  * 根据页码和显示行数进行换页
	  *@author guojl
	  */
	function query(pageNo,display_rows)
	{
	    if(pageNo<1){
	    	alert("已经是第一页!");
	    	console.log(".................");
	    	return false;
	    }
	    if(pageNo > '${pageInforBean.totalPage}'){
	    	alert("已经是最后一页!");
	    	return false;
	    }
	   
		document.getElementById("sea-form").action="../adminIncomePageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
		document.getElementById("sea-form").submit();
	    //window.location.href="../adminIncomePageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows+"&startTime="+startTime+"&endTime="+endTime+"&in_upuser="+in_upuser;
	
	}
 
</script>
</body>
</html>