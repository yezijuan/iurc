<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
  </head>
  	
  <body>
    <form role="form" method="post" action="user/changePassword" >
        <div class="form-group">
            <label class="col-sm-4 control-label">设置密码：</label>
            <div class="col-sm-10">
                <input class="form-control input-sm" type="password" id="password" type="text" name="password"
                       value="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-6 control-label">再次输入密码：</label>
            <div class="col-sm-10">
                <input class="form-control input-sm" type="password" id="repassword" type="text" name="repassword"
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
                <button type="submit" class="btn btn-default" >确认修改</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </div>
    </form>
  </body>
</html>
