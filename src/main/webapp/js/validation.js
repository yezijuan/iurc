
//检查用户名
function checkName(){
	var username = document.getElementById("username").value;
	var spanNode = document.getElementById("usernameTips");
	//用户名的规则是：手机号
	var reg = /^1[34578]\d{9}$/;
	if(reg.test(username)){
		spanNode.innerHTML = "用户名正确".fontcolor("green");
		return true;
	}else{
		spanNode.innerHTML = "用户名错误".fontcolor("red");
		return false;
	}
}


//检查密码
function checkPass(){
	var password = document.getElementById("password").value;
	var spanNode = document.getElementById("passwordTips");
	//登陆密码的规则是：由英文字母+数字组成的6~10长度的字符串
	var reg = /^[a-zA-Z]\w{5,9}$/;
	if(reg.test(password)){
		spanNode.innerHTML = "密码规范".fontcolor("green");
		return true;
	}else{
		spanNode.innerHTML = "密码不规范".fontcolor("red");
		return false;
	}
}

//检查确认密码
function checkRePass(){
	var repassword = document.getElementById("repassword").value;
	var password = document.getElementById("password").value;
	var spanNode = document.getElementById("repasswordTips");
	if(password == repassword){
		spanNode.innerHTML = "输入密码一致".fontcolor("green");
		return true;
	}else{
		spanNode.innerHTML = "两次密码输入不一致".fontcolor("red");
		return false;
	}
}
//表单验证
function checkAll(){
	var username = checkName();
	var password = checkPass();
	var repassword = checkRePass();
	if(username&&password&&repassword){
		return true;
	}else{
		return false;
	}
}
