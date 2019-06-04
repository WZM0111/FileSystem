<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
  <head>
    <title>充值页面</title>
   <meta charset="UTF-8">
<title>用户充值页面</title>

<link rel="stylesheet" type="text/css" href="css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>
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

.nav0 ul li{
	
}
.daohangdiv{
	
}
</style>
    

<script type="text/javascript">	 
	 function chongzhi() {
		document.getElementById('doc-vld-msg').action ="<%=path%>/cz2/cz2.do";		 
		document.getElementById('doc-vld-msg').submit();		
	}
	
</script>

</head>
<body>
  
  <div id="daohangdiv">
  <div class="nav0">
    <ul  >
    <li class="active" ><a href="#">Home</a></li>
    <li><a href="#">SVN</a></li>
    <li><a href="#">iOS</a></li>
    <li><a href="#">VB.Net</a></li>
    <li><a href="#">Java</a></li>
    <li><a href="#">PHP</a></li>
 </ul>
 </div>  
  
  </div>
  
  
  
<div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
	
		<div class="tr_rechtext">
			<p class="te_retit"><img src="images/coin.png" alt="" />充值中心</p>
			<p>  </p>
			<p>  </p>
		</div>
		<form action="" class="am-form" id="doc-vld-msg" method="post" >
			<div class="tr_rechbox">
				<div class="tr_rechhead">
					<img src="images/ys_head2.jpg" />
					<p>充值帐户名：
						   <input id="u18_input" type="text" value="" name="txtusername"/>
					</p>
					<div class="tr_rechheadcion">
						<img src="images/coin.png" alt="" />
						
					</div>
				</div>
				<div class="tr_rechli am-form-group">
					<ul class="ui-choose am-form-group"  id="uc_01" >
						<li  >
							<label class="am-radio-inline" style="line-height: 30px">
									<input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> <font size="3px"><b>一个月（￥9.9）</b></font>
								</label>
						</li>
						<li>
							<label class="am-radio-inline" style="line-height: 30px">
									<input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> <font size="3px"><b>二个月（￥19.9）</b></font>
								</label>
						</li>

						<li>
							<label class="am-radio-inline" style="line-height: 30px">
									<input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"><font size="3px"><b>三个月（￥29.9）</b></font>
								</label>
						</li>
						
					</ul>
				
				</div>
				
		
				
				
				<div class="tr_rechnum">
					<span>应付金额：</span>
					<p class="rechnum">0.00元</p>   <input id="miane" name ="miane" type="hidden" value="5"   />
				</div>
			</div>
			<div class="tr_paybox">
				<input type="submit" value="确认支付" class="tr_pay am-btn" onclick="chongzhi();" />
				<span>温馨提示： 。</span>
			</div>
		</form>
	</div>
</div>

  
  <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/ui-choose.js"></script>
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
			$('.rechnum').text('9.9元');
			 document.getElementById("miane").value="9.9";
			
		})
		$('#uc_01 li:eq(1)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('19.9元');
			$('.othbox').val('');
			document.getElementById("miane").value="19.9";
		})
		$('#uc_01 li:eq(2)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('29.9元');
			document.getElementById("miane").value="29.9";
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
		$('#doc-vld-msg').validator({
			onValid: function(validity) {
				$(validity.field).closest('.am-form-group').find('.am-alert').hide();
			},
			onInValid: function(validity) {
				var $field = $(validity.field);
				var $group = $field.closest('.am-form-group');
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	});
</script>

  
  
  </body>
</html>
