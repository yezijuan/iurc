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
    <title>新闻收藏</title>

    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<style>
		td {
		      white-space:nowrap;overflow:hidden;text-overflow: ellipsis;
		}
	</style>
		<script type="text/javascript">
		//加载数据
		$(function(){
			$.ajax({
				url:"news/myRelease",
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					var newsList = json.newsList;
					if(newsList!=null){
						$.each(newsList,function(i){
							var news = newsList[i];
						//	console.log(news);
							$("#news").append(
								'<tr><td>'+
								news.title+
								'</td><td>'+
								news.content+
								'</td><td>'+
								news.newsTypeId+
								'</td><td>'+
								news.readCounts+
								'</td><td>'+
								news.praiseCounts+
								'</td><td>'+
								news.collectionCounts+
								'</td><td>'+
								news.checked+
								'</td><td>'+
								news.createTime+
								'</td></tr> '
							);
						});
					}
				}
			});
		});
	</script>
</head>		
  <body>
    <div class="row" style="width: 100%;">
		<div class="col-md-12">
			<div class="panel panel-default" id="show">
				  <div class="panel-heading">审核通过且已发布的新闻</div>
				  <table class="table table-hover" style="table-layout: fixed;" id="news">
				  <tr onselectstart="return false" onselect="document.selection.empty()">
					<th>标题</th>
					<th>内容</th>
					<th  style="width: 80px;">新闻类型</th>
					<th style="width: 80px;">阅读量</th>
					<th style="width: 80px;">点赞量</th>
					<th style="width: 80px;">收藏量</th>
					<th style="width: 80px;">审核状态</th>
					<th style="width: 180px;">提交时间</th>
					</tr>
				</table>
				</div>
		</div>
	</div>
  </body>
</html>