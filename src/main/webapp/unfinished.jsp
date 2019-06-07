<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>合作项目</title>
    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"project/query",
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json.state){
						//清空
					//	$('#unfinishedShow').empty();
						var f=json.project;
						$.each(f,function(i){
							$("#unfinishedShow").append(
			    				'<div><h4>'+
			    				f[i].projectName+
			    				'</h4><p>'+
			    				f[i].projectContent+
			    				'</p><span>'+
			    				f[i].projectFoundingTime+
			    				'</span><hr></div>'
				    		);
						});
					
					}
				}
			});
		});
	</script>

  </head>
  
  <body>
    <div class="col-md-12" id="unfinishedShow">
		
	</div>
  </body>
</html>
