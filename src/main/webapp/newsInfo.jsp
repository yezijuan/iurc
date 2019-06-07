<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
    <title>新闻资讯</title>

		 
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
  
	<script type="text/javascript">
		function good(id){
			//alert("id="+id);
			//location.replace(location.href);
			$.ajax({
				url:"good?id="+id,
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.state==1){
						location.replace(location.href);
					}else{
						$.messager.alert('警告',data.msg,'info');    
					}
				}
			});
		}
		
		function collect(id){
			$.ajax({
				url:"collect?id="+id,
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.state==1){
						location.replace(location.href);
					}else{
						$.messager.alert('警告',data.msg,'info');    
					}
				}
			});
		}
	</script>

  </head>
  
  <body>
 
    <div class="container">
    	<div class="page-header" style="text-align: center; height: 650px;">
    	 <!-- 水平线 -->
   		 <hr class="featurette-divider">
   		 	<div style="text-align: left;">
   		 		<p style="font-size: 30px;">NEWS INFORMATION</p>
  				<p style="font-size: 20px;">新闻资讯</p>
  			</div>
  			<h1 style="font-size: 20px;">${news.title }</h1>
  			<div style="text-align:left;">
  				<label>发布时间：${news.reportTime }</label>
  				<label>&nbsp;&nbsp;&nbsp;&nbsp;作者编号：${news.author }</label>
  				<label>&nbsp;&nbsp;&nbsp;&nbsp;阅读量：${news.readCounts }</label>
  				<label id="pc">&nbsp;&nbsp;&nbsp;&nbsp;点赞量：${news.praiseCounts }</label>
  				<label id="cc">&nbsp;&nbsp;&nbsp;&nbsp;收藏量：${news.collectionCounts }</label>
  			</div>
  			<hr class="featurette-divider">
  			<div style="text-align:left;height: 400px;">
  				<p class="navbar-text" >${news.content }</p>
  				<div style="text-align: center;"><img src="${news.picture }" height="200" ></div>
  			</div>
  			<div style="text-align:right;">
				<button class="btn btn-default" onclick="good('${news.id }')">点赞</button>
				<button class="btn btn-default" onclick="collect('${news.id }')">收藏</button>
			</div>
		</div>	
	    
    </div>
    <footer>
	    <div class="container">
	 	 <div style="height: 50px;">	
		      <div style="text-align: center;">
		        <p>广西师范大学&copy; 2019 CopyRight</p>
		      </div>
	
	  	 </div>
	  </div>
  </footer>
  </body>
</html>
