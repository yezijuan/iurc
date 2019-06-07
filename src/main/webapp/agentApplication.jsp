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
    <title>代理申请</title>
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
	<script type="text/javascript">
		function put(){
			var f = $('#agentForm');
			var data = f.serialize();
			$.ajax({
				url:"unit/agentApplication",
				type:"post",
				data:data,
				dataType:"json",
				success:function(result){
					console.log(result);
					alert(result.msg);
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<div class="container">
	    <form method="post" id="agentForm">
		  <div class="form-group">
		    <label for="unitName">单位名称</label>
		    <input type="text" class="form-control" name="unitName" placeholder="单位名称" size="50" style="width: 800px;">
		  </div>
		  <div class="form-group">
		    <label for="introduction" style="display: block;">单位介绍</label>
		    <textarea rows="3" cols="20" name="introduction" style="width: 800px; height: 200px;">
		    </textarea>
		  </div>
		  <div class="form-group">
		    <label for="industryField" style="display: block;">行业领域</label>
		    <textarea rows="3" cols="20" name="industryField" style="width: 800px; height: 200px;">
		    </textarea>
		  </div>
		  <div class="form-group">
		    <label for="advantage" style="display: block;">发展优势</label>
		    <textarea rows="2" cols="20" name="advantage" style="width: 800px; height: 200px;">
		    </textarea>
		  </div>
		  <div class="form-group" style="width:305px;height: 55px;">
		    <label for="unitType" >单位类型：</label>
		    <select class="form-control" name="unitType" style="width:300px;">   
		    	<option value="1">企业类型</option>
		    	<option value="2">高校类型</option>
		    	<option value="3">科研类型</option>
			</select>
		  </div>
		  <div class="form-group">
		    <label for="phone">联系电话</label>
		    <input type="text" class="form-control" name="phone" placeholder="联系电话" size="50" style="width: 800px;">
		  </div>
		  <div class="form-group">
		    <label for="address">联系地址</label>
		    <input type="text" class="form-control" name="address" placeholder="联系地址" size="50" style="width: 800px;">
		  </div>
		  <button type="submit" class="btn btn-default" onclick="put()">提交</button>
		</form>
	</div>
  </body>
</html>
