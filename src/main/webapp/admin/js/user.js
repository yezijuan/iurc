//后台请求地址
		var url = "";
		/**
		 *	新增
		 */
    	function add(){
    		//重置表单数据
			$("#ff").form("reset");
			$("#dd").dialog({
				title:"新增",
				closed:false,
				modal:true,
				width: 600,    
			    height: 280, 
			    resizable:true,
				buttons:[{
					text:'保存',
					iconCls:"icon-save",
					handler:function(){
						url = "user/add";						
						save();
					}
				},{
					text:'关闭',
					iconCls:"icon-cancel",
					handler:function(){
						//调用close方法关闭对话框
						$("#dd").dialog("close");
					}
				}]
			});
    	}
    	/**
		 *	修改
		 */
    	function update(){
    		//重置表单数据
			$("#ff").form("reset");
			var array = $("#dg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要修改的记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能修改一条记录","warning");
				return;
			}
			//把选中的记录对象加载到form表单中填充
			$("#ff").form("load",array[0]);
			
			//弹出修改对话框
			$("#dd").dialog({
				title:"修改",
				closed:false,
				modal:true,
				width: 800,    
			    height: 300, 
			    resizable:true,
				buttons:[{
					text:'保存',
					iconCls:"icon-save",
					handler:function(){
						url = "user/update";
						save();
					}
				},{
					text:'关闭',
					iconCls:"icon-cancel",
					handler:function(){
						//调用close方法关闭对话框
						$("#dd").dialog("close");
					}
				}]
			});
    	}
    	/**
		 *	删除
		 */
    	function remove(){
    		var array = $("#dg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要删除的记录","warning");
				return;
			}
			$.messager.confirm("提示消息","您确定要删除这"+array.length+"条记录？",function(r){
				//用户点击"确定"按钮
				if(r){
					//获取所有选中的记录id组成的字符串，格式是:"1,2,3,4"
					var ids = "";
					for(var i=0;i<array.length;i++){
						ids += array[i].id+",";
					}
					ids = ids.substring(0, ids.length-1);
					$.ajax({
						url:"user/deleteMore?ids="+ids,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.state==1){
								//提示消息
								$.messager.alert("提示消息",data.msg,"info");
								//刷新列表
								$("#dg").datagrid("reload");
							}else{
								$.messager.alert("提示消息",data.msg,"error");
							}
						}
					});
				}
			});
    	}
    	/**
		 *	保存数据
		 */
    	function save(){
    		
			$("#ff").form('submit',{
				url:url,
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
						$("#dd").dialog("close");
						//刷新列表
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("提示消息",data.msg,"error");
					}
				}

			});
    	}
    	/**
		 *	查看详情
		 */
    	function detail(){
    		//重置表单数据
			$("#df").form("reset");
			var array = $("#dg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要查看的记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能查看一条记录","warning");
				return;
			}
			$("#detail").dialog({
				title:"详细信息",
				closed:false,
				modal:true,
				width: 800,    
			    height: 400, 
				buttons:[{
					text:'关闭',
					iconCls:"icon-cancel",
					handler:function(){
						//调用close方法关闭对话框
						$("#detail").dialog("close");
					}
				}]
			});
			
			//把选中的记录对象加载到form表单中填充
		//	$("#df").form("load",array[0].user);
		//	$("#df").form("load",array[0].unit);
			
			$("#df").form("load",{
				uname:array[0].uname,
				username:array[0].username,
				password:array[0].password,
				userType:array[0].userType,
				phone:array[0].phone,
				address:array[0].address,
				sex:array[0].sex,
				age:array[0].age,
				img:array[0].img,
				unitId:array[0].unitId,
				qqEmail:array[0].qqEmail,
				weChat:array[0].weChat,
				state:array[0].state,
				birthday:array[0].birthday,
				createTime:array[0].createTime
			});
			
    	}
    	//审核用户：禁用
    	function disables(){
    		var array = $("#dg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要禁用的用户记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能修改一条记录","warning");
				return;
			}
			$.messager.confirm("提示消息","您确定要禁用该用户："+array[0].id+"吗？",function(r){
				//用户点击"确定"按钮
				if(r){
					//获取所有选中的记录id
					var id =  array[0].id;
					$.ajax({
						url:"user/disablesById?id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.state==1){
								//提示消息
								$.messager.alert("提示消息",data.msg,"info");
								//刷新列表
								$("#dg").datagrid("reload");
							}else{
								$.messager.alert("提示消息",data.msg,"error");
							}
						}
					});
				}
			});
    	}
    	
    	
    	
		$(function(){
			$("#dg").datagrid({
				url:"user/queryByPage",
				method:"post",
				columns:[[
				    {field:"",checkbox:true},
		          	{field:"id",title:"编号",width:100,align:"center",sortable:true,order:"desc"},
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
		          	{field:"age",title:"年龄",width:80,align:"center",sortable:true,order:"desc"},
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
				pagePosition:"bottom",
				pageNumber: 1, //默认显示第几页
				pageSize: 5,
				pageList: [5, 10, 15, 20],
				toolbar: [{
					text:"新增",
					iconCls: 'icon-add',
					handler: function(){
						add();
					}
				},'-',{
					text:"修改",
					iconCls: 'icon-edit',
					handler: function(){
						update();
					}
				},'-',{
					text:"删除",
					iconCls: 'icon-remove',
					handler: function(){
						remove();
					}
				},'-',{
					text:"查看详情",
					iconCls: 'icon-more',
					handler: function(){
						detail();
					}
				},'-',{
					text:"禁用",
					iconCls: 'icon-lock',
					handler: function(){
						disables();
					}
				}]	
			});

		});
		
		
