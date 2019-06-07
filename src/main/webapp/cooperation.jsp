<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加代理</title>
   
    
	 <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script> -->
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">

		$(function(){
			var myselect1=document.getElementById("condition1");//拿到select对象
			var index1=myselect1.selectedIndex ; // selectedIndex代表的是你所选中项的index
			var condition1=myselect1.options[index1].value;//拿到选中项options的value
			var condition2=document.getElementById("condition2").value;//拿到input中的value
			$("#cooperation").datagrid({
				url:"cooperation/searchByCondition?condition1="+condition1+"&condition2="+condition2,
				method:"post",
				columns:[[
		          	{field:"id",title:"编号",width:50,align:"center"},
		          	{field:"cUnitId",title:"合作单位编号",width:80,align:"center"},
		          	{field:"projectId",title:"合作项目编号",width:100,align:"center"},
		          	{field:"contract",title:"合同内容",width:300,align:"center"},
		          	{field:"cooperatedTime",title:"合作时间",width:100,align:"center"},
		          	{field:"state",title:"状态",width:50,align:"center"}
				]],
				fit:true,
				fitColumns:true,
				pagination:true,
				pagePosition:"top",
				pageNumber: 1, //默认显示第几页
				pageSize: 5,
				pageList: [5, 10, 15, 20]	
			});

		});
		
		
		
	</script>

  </head>
  
  <body>
	<form class="navbar-form navbar-left" role="search" id="searchForm">
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-12 control-label">选择搜索条件：</label>
		</div>
		<select name="condition1" id="condition1" class="js-data-example-ajax form-control">
		  <option value="id"  selected="selected">项目id</option>
		  <option value="cUnitId">合作单位编号</option>
		</select>
      <div class="form-group">
        <input name="condition2" id="condition2" type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default" onclick="searchByCondition()">搜索</button>
    </form>
    
    <table id="cooperation">
   
  </body>
</html>
