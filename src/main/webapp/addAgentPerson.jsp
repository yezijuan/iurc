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
			$("#users").datagrid({
				url:"user/searchByCondition?condition1="+condition1+"&condition2="+condition2,
				method:"post",
				columns:[[
		          	{field:"id",title:"编号",width:100,align:"center"},
		          	{field:"uname",title:"姓名",width:200,align:"center"},
		          	{field:"username",title:"账号",width:200,align:"center"},
		          	{field:"userType",title:"类型",width:100,align:"center"},
		          	{field:"phone",title:"电话",width:200,align:"center"},
		          	{field:"address",title:"地址",width:200,align:"center"},
		          	{field:"sex",title:"性别",width:80,align:"center",formatter:function(value,row,index){
						if(value==1){
							return "男";
						}else{
							return "女";
						}
			        }},
		          	{field:"age",title:"年龄",width:80,align:"center"},
		          	{field:"birthday",title:"生日",width:200,align:"center"},
		          	{field:"img",title:"头像",width:100,align:"center"},
		          	{field:"unitId",title:"单位",width:100,align:"center"},
		          	{field:"createTime",title:"创建时间",width:200,align:"center"},
		          	{field:"qqEmail",title:"邮箱",width:100,align:"center"},
		          	{field:"weChat",title:"微信",width:100,align:"center"},
		          	{field:"state",title:"状态",width:100,align:"center"}
				]],
				fit:true,
				fitColumns:true,
				pagination:true,
				pagePosition:"top",
				pageNumber: 1, //默认显示第几页
				pageSize: 5,
				pageList: [5, 10, 15, 20],
				toolbar: [{
					text:"添加代理",
					iconCls: 'icon-add',
					handler: function(){
						add();
					}
				}]	
			});

		});
		
		function add(){
			var array = $("#users").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要添加的用户","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能添加一个用户","warning");
				return;
			}
			$.messager.confirm("提示消息","您确定要添加该用户："+array[0].id+"为单位代理人吗？",function(r){
				//用户点击"确定"按钮
				if(r){
					//获取所有选中的记录id
					var id =  array[0].id;
					$.ajax({
						url:"user/addAgentById?id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.state==1){
								//提示消息
								$.messager.alert("提示消息",data.msg,"info");
								//刷新列表
								$("#users").datagrid("reload");
							}else{
								$.messager.alert("提示消息",data.msg,"error");
							}
						}
					});
				}
			});
		}
		
		
		
	</script>

  </head>
  
  <body>
	<form class="navbar-form navbar-left" role="search" id="searchForm">
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-12 control-label">选择搜索条件：</label>
		</div>
		<select name="condition1" id="condition1" class="js-data-example-ajax form-control">
		  <option value="id">用户id</option>
		  <option value="uname">用户名称</option>
		  <option value="username" selected="selected">登录账号</option>
		  <option value="phone">手机号</option>
		  <option value="qqEmail">邮箱账号</option>
		  <option value="weChat">微信账号</option>
		</select>
      <div class="form-group">
        <input name="condition2" id="condition2" type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default" onclick="searchByCondition()">搜索</button>
    </form>
    
    <table id="users">
   
  </body>
</html>
