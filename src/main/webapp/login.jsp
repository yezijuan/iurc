<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>用户登录</title>

    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


    <!--引入jquery
	<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
	-->
	    

    <script type="text/javascript">
         function reloadImg(){
            $('#rendomCode')[0].src = "rendomCode.jsp?_time="+new Date().getTime().toString();
        }
        
        function toLogin(){
			var f = $('#loginForm');
			var data = f.serialize();
			$.ajax({
				type:'post',
				url:'user/login',
				data:data,
				dataType:'json',
				success:function(result){
					if(!result.state){//登陆失败
						alert(result.msg);
						//刷新验证码
						reloadImg();
						return;
					}
					//网页重定向
					window.location.href = 'index.jsp';
				}
			});
			
		} 
    </script>

</head>
<body>
<div style="background:url(images/bg.gif);height: 600px;width: 85%; background-size:100% 100%; margin: 0 auto;padding-top: 0;">
    <div class="container">
        <div style="position: absolute;">
            <div id="logo">
                <img alt="" src="images/logo.png" style="width: 100px;height: 100px;margin-left: 200px;margin-top: 50px; ">
                <img alt="" src="images/logoinfo.png" style="width: 350px;height: 100px; ">
                <div style="float: right;">
                </div>
            </div>
            <div style="float: left;">
                <div style="position: absolute;">
                    <img alt="" src="images/shakehands.png" style="width: 350px;height: 300px; margin-left: 200px;margin-top: 80px;">
                </div>
            </div>
            <div id="login" style="margin-left: 70%; width: 300px;">
                <form id="loginForm" role="form" method="post" action="user/login">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">账号：</label>
                        <div class="col-sm-10">
                            <input class="form-control input-sm" id="username" type="text" name="username"  
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密码：</label>
                        <div class="col-sm-10">
                            <input class="form-control input-sm" id="password" type="password" name="password" 
                                   value="">
                        </div>
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
                            <button type="submit" class="btn btn-default">登录</button>
                            <button type="reset" class="btn btn-default">重置</button>
                        </div>
                    </div>                
                </form>
                	<div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10"  style="margin-top: 5px;text-align: center;">
                            <label class="col-sm-5 control-label"><a href="forgetPassword.jsp" target="_blank">忘记密码</a></label>
                            <label class="col-sm-5 control-label"><a href="register.jsp" target="_blank">快速注册</a></label>
                        </div>
                 	</div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
