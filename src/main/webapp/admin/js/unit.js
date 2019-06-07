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
						url = "unit/add";						
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
						url = "unit/update";
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
						url:"unit/deleteMore?ids="+ids,
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
    	/**
		 *	查看详情
		 */
    	function detail(){
			var array = $("#udg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要查看的记录","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能查看一条记录","warning");
				return;
			}
			//跳转到单位详情界面
			window.open('unit/queryInfo?id='+array[0].id,'_blank'); 
		
    	}
    	
    	//审核单位：
    	function check(){
    		var array = $("#udg").datagrid("getSelections");
			if(array.length==0){
				$.messager.alert("提示消息","请选择要审核的单位","warning");
				return;
			}
			if(array.length>1){
				$.messager.alert("提示消息","一次只能修改一条记录","warning");
				return;
			}
			$.messager.confirm("提示消息","您确定要审核通过编号为："+array[0].id+" 的单位吗？",function(r){
				//用户点击"确定"按钮
				if(r){
					//获取所有选中的记录id
					var id =  array[0].id;
					$.ajax({
						url:"unit/checkById?id="+id,
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
			$("#udg").datagrid({
				url:"unit/queryByPage",
				method:"post",
				columns:[[
				    {field:"",checkbox:true},
		          	{field:"id",title:"编号",width:100,align:"center",sortable:true,order:"desc"},
		          	{field:"unitName",title:"单位名称",width:200,align:"center"},
		          	{field:"introduction",title:"单位简介",width:200,align:"center"},
		          	{field:"uid",title:"代理人",width:100,align:"center"},
		          	{field:"phone",title:"电话",width:200,align:"center"},
		          	{field:"address",title:"地址",width:200,align:"center"},
		          	{field:"unitType",title:"单位类别",width:80,align:"center",formatter:function(value,row,index){
						if(value==1){
							return "企业";
						}
						if(value==2){
							return "高校";
						}
						if(value==3){
							return "科研";
						}
			        }},
		          	{field:"industryField",title:"行业领域",width:80,align:"center",sortable:true,order:"desc"},
		          	{field:"advantage",title:"发展优势",width:200,align:"center"},
		          	{field:"state",title:"状态",width:200,align:"center"}
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
				},'-',{
					text:"查看详情",
					iconCls: 'icon-more',
					handler: function(){
						detail();
					}
				},'-',{
					text:"单位审核",
					iconCls: 'icon-ok',
					handler: function(){
						check();
					}
				}]	
			});

		});
		
		
