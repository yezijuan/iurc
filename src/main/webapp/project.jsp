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
			$("#project").datagrid({
				url:"project/searchByCondition?condition1="+condition1+"&condition2="+condition2,
				method:"post",
				columns:[[
		          	{field:"id",title:"项目编号",width:50,align:"center"},
		          	{field:"unitId",title:"单位编号",width:80,align:"center"},
		          	{field:"projectName",title:"项目名称",width:100,align:"center"},
		          	{field:"projectContent",title:"项目内容",width:300,align:"center"},
		          	{field:"projectFoundingTime",title:"项目发布时间",width:100,align:"center"},
		          	{field:"state",title:"状态",width:50,align:"center"}
				]],
				fit:true,
				fitColumns:true,
				pagination:true,
				pagePosition:"top",
				pageNumber: 1, //默认显示第几页
				pageSize: 5,
				pageList: [5, 10, 15, 20],
				toolbar: [{
					text:"项目合作",
					iconCls: 'icon-ok',
					handler: function(){
						addCooperation();
					}
				}]	
			});

		});
		
		/* 
		//合作
    	function cooperate(){
    		var array = $("#project").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要一条记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能跟签订一个项目","warning");
				return;
			}
			$.messager.confirm("提示消息","您确定要签订 项目为："+array[0].id+" 的合作吗？",function(r){
				//用户点击"确定"按钮
				if(r){
					//获取所有选中的记录id
					var id =  array[0].id;
					
					$.ajax({
						url:"cooperation/addCooperation",
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.state==1){
								//提示消息
								$.messager.alert("提示消息",data.msg,"info");
								//刷新列表
								$("#project").datagrid("reload");
							}else{
								$.messager.alert("提示消息",data.msg,"error");
							}
						}
					});
				}
			});
    	}
    	 */
    	function addCooperation(){
    		var array = $("#project").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要一条记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能跟签订一个项目","warning");
				return;
			}
			
    		//重置表单数据
			$("#ff").form("reset");
			$("#detail").dialog({
				title:"新增合同",
				closed:false,
				modal:true,
				width: 600,    
			    height: 280, 
			    resizable:true,
				buttons:[{
					text:'保存',
					iconCls:"icon-save",
					handler:function(){						
						save();
					}
				},{
					text:'关闭',
					iconCls:"icon-cancel",
					handler:function(){
						//调用close方法关闭对话框
						$("#detail").dialog("close");
					}
				}]
			});
    	}
    	/**
		 *	保存数据
		 */
    	function save(){
    		
			$("#ff").form('submit',{
				url:"cooperation/addCooperation",
				//当表单提交时，该事件返回true则提交，返回false不提交
				onSubmit:function(){
					//校验form表单中所有validatebox，只能全部符合条件才返回true
					//return $("#ff").form("validate");
				},
				success:function(data){
					data = eval("("+data+")");
					if(data.state==1){
						//弹出提示消息
						$.messager.alert("提示消息",data.msg,"info");
						//关闭对话框
						$("#detail").dialog("close");
						//刷新列表
						$("#project").datagrid("reload");
					}else{
						$.messager.alert("提示消息",data.msg,"error");
					}
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
		  <option value="id"  selected="selected">项目id</option>
		  <option value="unitId">单位编号</option>
		  <option value="projectName">项目名称</option>
		</select>
      <div class="form-group">
        <input name="condition2" id="condition2" type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default" onclick="searchByCondition()">搜索</button>
    </form>
    
    <table id="project">
   <div id="detail" class="easyui-dialog" style="width: 400px;" closed="true">
   	<form action="" method="post" id="ff">
   		<input type="hidden" name="id"  />
   		<input type="hidden" name="unitId" />
   		<table>
   			<tr>
   				<td class="label" >
   					<div class="form-group">合同内容：</div>
   				</td>
   				<td>
   					<div class="form-group">
					    <textarea rows="3" cols="20" name="contract" style="width: 400px; height: 100px;"></textarea>
				  	</div>
				</td>
   			</tr>
		</table>
	</form>	
   </div>
  </body>
</html>
