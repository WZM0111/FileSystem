<%@page import="common.bean.PageInforBean"%>
<%@page import="common.bean.FileInfoBean"%>
<%@page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文章列表</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="//layui.hcwl520.com.cn/layui-v2.4.5/css/layui.css?v=201811010202">
<link rel="stylesheet" href="../css/scroll-bar.css">
<link rel="stylesheet" href="../css/sub-page.css">
<link rel="stylesheet"
	href="//at.alicdn.com/t/font_693759_wytlyqhtdtj1nhfr.css">
<link rel="stylesheet" href="../lib/nprogress/nprogress.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="ok-body">
		<!--面包屑导航区域-->
		<div class="ok-body-breadcrumb">
			<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>常用页面</cite></a>
				<a><cite>文章列表</cite></a> <a><cite><span>共有数据：<i
							id="countNum">${pageInforBean.totalNumber}</i> 条
					</span></cite></a>
			</span> <a class="layui-btn layui-btn-small"
				href="../adminFilesPageListAction?method=firstPage" title="刷新">
				<i class="layui-icon layui-icon-refresh"></i>
			</a>
		</div>
		<!--模糊搜索区域-->
		<form id="myform" class="layui-form layui-col-md12 ok-search" method="post">
		<div class="layui-row">
				<input class="layui-input" placeholder="开始日期" autocomplete="off"
					id="startTime" name="startTime" value="${startTime}">
				<input class="layui-input" placeholder="截止日期" autocomplete="off"
					id="endTime" name="endTime" value="${endTime}">
				<input class="layui-input" placeholder="请输入标题" autocomplete="off"
					id="in_filename" name="in_filename"
					value="${in_filename }">
				<a id="search" onclick="javascript:showFirstPage()">
					<button class="layui-btn" lay-submit="" lay-filter="search">
						<i class="layui-icon layui-icon-search"></i>
					</button>
				</a>
			
		</div>
		<!--工具栏-->
	<!-- 	<okToolbar>
		<button class="layui-btn layui-btn-normal" id="batchEnabled">
			<i class="iconfont icon-shangsheng"></i>批量上架
		</button>
		<button class="layui-btn layui-btn-warm" id="batchDisabled">
			<i class="iconfont icon-web-icon-"></i>批量下架
		</button>
		</okToolbar> -->
		<!--数据表格-->
		
		
		<div id="result">
			<table class="layui-table" id="tableId" lay-filter="tableFilter">
				<thead>
					<tr>
						<th width="80">ID</th>
						<th width="250" >标题</th>
						<th width="150">文件类型</th>
						<th width="140">下载量</th>
						<th width="100">上传者</th>
						<th width="200">上传时间</th>
						<th width="100">状态</th>
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
							FileInfoBean files = (FileInfoBean) currList.get(i);
							if (j % 2 == 0) {
					%>
					<tr style="background-color: #F2F2F2" >
						<%
							} else {
						%>
					
					<tr >
						<%
							}
						%>
						<td><%=j++%><input type="hidden" class="fileId" value="<%=files.getFileId()%>"></td></td>
						<td id="filename" ><%=files.getFileName()%>
							
						<td><%=files.getFileType()%></td>
						<td><%=files.getDownloadnum()%></td>
						<td><%=files.getUsername()%></td>
						<td><%=files.getUploadDate()%></td>
						<td>
						<%
						if(files.getSate()==1)
						{
						%>
							<input  type="checkbox" name="sate" id="sate" lay-skin="switch" lay-text="上架|下架" lay-filter="sate" checked >
						<%
						}else{
						%>
							<input  type="checkbox" name="sate" id="sate" lay-skin="switch" lay-text="上架|下架" lay-filter="sate">
						<%} %>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
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
    // 进度条加载提示
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    }
    // layui相关
    layui.use(['element', 'table', 'form', 'jquery', 'laydate'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        

        laydate.render({
            elem: '#startTime',
            type: "datetime",
        });

        laydate.render({
            elem: '#endTime',
            type: "datetime"
        });

        form.on('submit(search)', function () {
            layer.msg('正在查询，请稍后...');
            return false;
        });
	
        form.on('switch(sate)', function(obj){
        	var sate=obj.elem.checked;
        	var selectIfKey = obj.othis;
        	var parentTr = selectIfKey.parents("tr");
        	var td = parentTr.find('td:eq(0)');
        	var fileId = td.find('input')[0].value;
        	$.ajax({  
  	            type : "POST",  
  	            url : "<%=path%>/admin/adminFilesAction?method=sate",
  					data : {
  						sate : sate,
  						fileId : fileId,
  					},
  					dataType : "text",
  					success : function(msg) {
  						//console.log(msg)
  					},
  					error : function(XMLHttpRequest, textStatus, errorThrown) {
  						alert(XMLHttpRequest.status);
  					}
  			});
  		});
        
      //监听行双击事件
        $(document).on("dblclick","#result tr", function(obj){
        	var $tr=$(this);  //定位到当前行
        	//$tr.find("input[type=hidden]");
			var $td=$tr.find("td");  //定位到当前行的列
			var filename = $td.eq(1).text();
			var fileid=$td.find("input[type=hidden]").val();
        	layer.open({
                title: '查看文章',
                type: 2,
                shade: false,
                maxmin: true,
                shade: 0.5,
                anim: 4,
                area: ['90%', '90%'],
                content: 'article-edit.jsp?fileid='+fileid,
                zIndex: layer.zIndex,
                // skin: 'layui-layer-molv',
                
            });
        });
       
    });
    /** 
	  *显示首页功能
	  *@author guojl   
	 */
	function showFirstPage()
	{
		document.getElementById("myform").action="../adminFilesPageListAction?method=firstPage";
		document.getElementById("myform").submit();
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
	   
		/* document.forms[0].action="../adminUserPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
		document.forms[0].submit(); */
	   // window.location.href="../adminFilesPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows+"&startTime="+startTime+"&endTime="+endTime+"&in_filename="+in_filename;
	    document.getElementById("myform").action="../adminFilesPageListAction?method=showPage&pageNo="+pageNo+"&showCount="+display_rows;
	    document.getElementById("myform").submit();
	}
	
	
</script>
</body>
</html>