<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发表帖子</title>
      <!-- Bootstrap 外部样式连接   -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
	<style type="text/css">
		textarea {
					border: 1px solid #CCC;
	    			border-radius: 4px;
	    			box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
	    			transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
		}
	</style>

  </head>
  
  <body>
     <form action="theme/addTheme" method="post" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="title">标题</label>
	    <input type="text" class="form-control" name="title" placeholder="主题标题" size="50" style="width: 800px;">
	  </div>
	  <div class="form-group">
	    <label for="content" style="display: block;">主体内容</label>
	    <textarea rows="3" cols="20" name="content" style="width: 800px; height: 200px;">
	    </textarea>
	  </div>
	  <button type="submit" class="btn btn-default">发表</button>
	</form>
  </body>
</html>
