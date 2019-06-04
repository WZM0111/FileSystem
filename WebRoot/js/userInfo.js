function check() {
	var pass = document.getElementById("password_old").value;
	var newpass = document.getElementById("password_1").value;
	var repass = document.getElementById("password_2").value;

	var pattern_char = /[a-zA-Z]/g;

	var pattern_num = /[0-9]/g;
	
	var ls1=0;
	
	var ls2=0;

	if(newpass.match(pattern_char)!=null&&newpass.match(pattern_char).length>=4){ ls1++; }

	if(newpass.match(pattern_num)!=null&&newpass.match(pattern_num).length>=4){ ls2++; }

	if (pass == ""||pass.length > 15) {
	if(pass == "")
		document.getElementById("msg").innerHTML = "请输入当前密码";
		if (pass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	} else if (newpass == ""||newpass.length > 15) {
         if(newpass == "")
		document.getElementById("msg").innerHTML = "请输入新密码";
		if (newpass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	}else if (ls1==0||ls2==0) {
		 document.getElementById("msg").innerHTML = "密码必须由至少4个字母与4个数字组成，区分大小写";
		 return false;

	} 
	
	else if (repass == ""||repass.length > 15) {
        if(repass == "")
		document.getElementById("msg").innerHTML = "请确认新密码";
		if (repass.length > 15)
			document.getElementById("msg").innerHTML = "密码长度大于15,请重新输入";
		return false;
	}
	return true;

}

function check1() {
	if (check()) {
	
		document.getElementById('resetpasswordform').action = "/files/resetpassword?method=check";
		document.getElementById('resetpasswordform').submit();
		return true;
	}
}

function del() {
	document.getElementById('downloadfile').action = "/files/file?action=delete";
	document.getElementById('downloadfile').submit();
	return true;
	
}



$(function() { 
		$("#myButton4").click(function(){
			$(this).button('loading').delay(1000).queue(function() {
				$(this).button('complete');
			});        
		});
	});
	
function sel(a){
	  o=document.getElementsByName(a);
	  for(i=0;i<o.length;i++)
	  o[i].checked=event.srcElement.checked;
	 } 
	 
$(function () { 
	$("[data-toggle='popover']").popover();
});

function control(){
var i = $("#num").val();

$("#add").click(function () {
    i++;
    $("#num").attr("value", i);
   
}),
 $("#reduce").click(function (){
     i--;
 $("#num").attr("value", i);
 
  if (i < 0) {
 $("#num").attr("value", 0);
      i = 0;
     
     };
 });
}
