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
			/* var f = $('#addForm');
			var data = f.serialize();
			console.log(data); */
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			var picture = document.getElementById("picture").files[0];
			var newsTypeId = document.getElementById("newsTypeId").html;
			
			console.log(document.getElementById("picture").files[0]);
			$.ajax({
				url:"news/put",
				type:"post",
				data:{"title":title,"content":content,"picture":picture,"newsTypeId":newsTypeId},
				dataType:"json",
				success:function(result){
					console.log(result);
					if(result.state){
						$.messager.alert('提示',result.msg);
					}else{
						$.messager.alert('警告',result.msg,'info');
					}
					
				}
			});
		}
	</script>
  </head>
  
  <body>
     <form method="post" action="news/put" enctype="multipart/form-data" id="addForm">
	  
	  <div >
	    <label for="picture">新闻图片</label>
	    <img alt="新闻图片" src="" width="400" height="300"><br>
	    <input type="file" name="picture" id="picture">
	  </div>
	  <button type="submit" class="btn btn-default">提交</button>
	</form>
  </body>
</html>
