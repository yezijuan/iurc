<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>新闻发布</title>
    
    		 
	<!--基础样式包-->
	<!--easyui主题包-->
	<link rel="stylesheet" type="text/css" href="/iurc1.1/jquery-easyui-1.5.5.2/themes/gray/easyui.css">
	<!--图标包-->   
	<link rel="stylesheet" type="text/css" href="/iurc1.1/jquery-easyui-1.5.5.2/themes/icon.css">  
	<!--引入jquery--> 
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.min.js"></script>   
	<!--引入easyui环境-->
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
	
      <!-- Bootstrap 外部样式连接   -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
	  <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
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
     <form action="news/put?uploadPath=news" method="post" enctype="multipart/form-data" id="addForm">
	  <div class="form-group">
	    <label for="title">新闻标题</label>
	    <input type="text" class="form-control" name="title" placeholder="新闻标题" size="50" style="width: 800px;">
	  </div>
	  <div class="form-group">
	    <label for="content" style="display: block;">主体内容</label>
	    <textarea rows="3" cols="20" name="content" style="width: 800px; height: 200px;">
	    </textarea>
	  </div>
	  <div >
	    <label for="picture">新闻图片</label>
	    <img alt="新闻图片" src="" width="400" height="300"><br>
	    <input type="file" name="picture">
	  </div>
	  <div class="form-group" style="width:305px;height: 55px;">
	    <label for="newsTypeId" >新闻类型：</label>
	    <select class="form-control" name="newsTypeId" style="width:300px;">   
	    	<option value="1">合作新闻</option>
	    	<option value="2">科技新闻</option>
		</select>
	  </div>
	  <button type="submit" class="btn btn-default">提交</button>
	</form>
  </body>
</html>
