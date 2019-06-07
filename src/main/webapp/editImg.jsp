<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改头像</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/require.js"></script>
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
   	<form action="user/uploadImg?uploadPath=img" method="post" enctype="multipart/form-data">
   			当前头像：<br>
 		<img src="${user.img }" width="200" height="200"><br>
 		<br><br><br><br>
 		<input type="file" name="file"><br>
 		<input type="submit" value="修改头像"/>
   </form>
-
  </body>
</html>
