<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户注册</title>

    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script> -->
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	
	<script src="js/validation.js" type="text/javascript"></script>
	<script type="text/javascript">
		function register(){
        	$("#loginForm").form('submit',{
				url:"user/register",
				//当表单提交时，该事件返回true则提交，返回false不提交
				onSubmit:function(){
					//校验form表单中所有validatebox，只能全部符合条件才返回true
					//return $("#ff").form("validate");
					return checkAll();
				},
				success:function(data){
					data = eval("("+data+")");
					if(data.state==1){
						//弹出提示消息
						alert("提示消息:"+data.msg);
					}else{
						alert("提示消息:"+data.msg);
					}
				}

			});
        }
        
        function reloadImg(){
            $('#rendomCode')[0].src = "rendomCode.jsp?_time="+new Date().getTime().toString();
        }
	    
	</script>
    
</head>
<body>
<div class="container">
    <div style="position: absolute;">
        <div id="login" style="margin-left: 70%; width: 300px;">
            <form role="form" method="post" id="loginForm">
                <div class="form-group">
                    <label class="col-sm-4 control-label">手机号：</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" id="username" type="text"  name="username" id="username"
                               value="">
                    </div>
                    <span id="usernameTips" style="float: right;"> </span>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">设置密码：</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" type="password" id="password" type="text" name="password" id="password"
                               value="">
                    </div>
                    <span id="passwordTips" style="float: right;"> </span>
                </div>
                <div class="form-group">
                    <label class="col-sm-6 control-label">再次输入密码：</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" type="password" id="repassword" type="text" name="repassword" id="repassword"
                               value="">
                    </div>
                    <span id="repasswordTips" style="float: right;"> </span>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">验证码：</label>
                    <div class="col-sm-10">
                        <input class="form-control input-sm" id="code" type="text" name="code" 
                               value="">
                        <a href="javascript:void(0)" style="vertical-align: middle;">
                            <img id="rendomCode"
                                 height="40" width="95"
                                 style="vertical-align:bottom;"
                                 src="rendomCode.jsp"
                                 onclick="reloadImg()"
                                 title="点击图片更换验证码" />
                        </a>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10"  style="margin-top: 10px;">
                        <button type="button" class="btn btn-default" onclick="register()">注册</button>
                        <button type="reset" class="btn btn-default">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>