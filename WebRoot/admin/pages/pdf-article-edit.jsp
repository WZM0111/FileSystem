<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="common.bean.FileInfoBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
FileInfoBean bean=(FileInfoBean)session.getAttribute("filebean");
String savepath = request.getServletContext().getRealPath("/uploadFile");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑文章</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <link rel="stylesheet" href="css/scroll-bar.css">
    <link rel="stylesheet" href="css/sub-page.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_693759_wytlyqhtdtj1nhfr.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<script type="text/javascript" src="../static/jquery.min.js"></script>
	<script type="text/javascript" src="../static/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="../static/pdfobject.js"></script>
    <script type="text/javascript">
    /* function load(){  
	    $("#openFile").click(); 
	}
	 function upload() {
			var formData = new FormData($("#upload-form")[0]);
			$.ajax({
				url : '../adminOpenFile?method=convert',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					$("#office_preview").html(JSON.parse(returndata).content);
				},
				error : function(returndata) {
					console.log("error:");
				}
			});
		}  */
	
	/* var options = {
			height: "400px",
			pdfOpenParams: { scrollbars: '0', toolbar: '0', statusbar: '0'}
	};
	
	PDFObject.embed("../uploadFile/123456.pdf", "#preview"); */
    </script>
</head>
<body onload="load()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"   onbeforecopy="return false">
<div class="ok-body">
    <!--面包屑导航区域-->
    <div class="ok-body-breadcrumb">
            <span class="layui-breadcrumb">
                <a><cite>首页</cite></a>
                <a><cite>常用页面</cite></a>
                <a><cite>文章审核</cite></a>
                
            </span>
        <a class="layui-btn layui-btn-small" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh"></i>
        </a>
    </div>
 		<embed src="../uploadFile/<%=bean.getFileName() %>.pdf#scrollbars=0&toolbar=0&statusbar=0" type="application/pdf" width="100%" height="100%" >
</div>
<!--js逻辑-->
<script src="lib/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'jquery', 'laydate'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#birthday',
            type: "datetime"
        });

        form.verify({
            birthdayVerify: [/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))(\s(([01]\d{1})|(2[0123])):([0-5]\d):([0-5]\d))?$/, '日期格式不正确']
        });

        form.on('submit(edit)', function (data) {
            console.log(data.field);
            layer.msg("编辑成功！", {icon: 6, time: 1000, anim: 4}, function () {
                parent.layer.close(parent.layer.getFrameIndex(window.name));
            });
            return false;
        });
    });
   
</script>
</body>
</html>