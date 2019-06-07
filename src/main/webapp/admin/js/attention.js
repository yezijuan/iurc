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
						url = "attention/add";						
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
			var array = $("#udg").datagrid("getSelections");
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
						url = "attention/update";
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
    		var array = $("#udg").datagrid("getSelections");
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
						url:"attention/deleteMore?ids="+ids,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.state==1){
								//提示消息
								$.messager.alert("提示消息",data.msg,"info");
								//刷新列表
								$("#udg").datagrid("reload");
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
						$("#udg").datagrid("reload");
					}else{
						$.messager.alert("提示消息",data.msg,"error");
					}
				}

			});
    	}
    	
		$(function(){
			$("#udg").datagrid({
				url:"attention/queryByPage",
				method:"post",
				columns:[[
				    {field:"",checkbox:true},
		          	{field:"id",title:"编号",width:50,align:"center",sortable:true,order:"desc"},
		          	{field:"uid",title:"用户",width:100,align:"center"},
		          	{field:"aid",title:"关注用户",width:100,align:"center"},
		          	{field:"createTime",title:"回复时间",width:200,align:"center"},
		          	{field:"state",title:"状态",width:100,align:"center"}
				]],
				fit:true,
				fitColumns:true,
				pagination:true,
				pageSize:5,
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
				}]	
			});

		});
		
		
