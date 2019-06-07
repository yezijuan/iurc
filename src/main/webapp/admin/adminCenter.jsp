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
    
    <title>管理员中心</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.5.2/themes/gray/easyui.css">
	<style type="text/css">
		.img-circle{
			width: 30px;
			height: 30px;
			border-radius: 50%;
			-moz-border-radius: 50%;
			-webkit-border-radius: 50%;
		}
	</style>
	
	<script type="text/javascript">

		$(function(){
			$.ajax({
				url:"user/islogin",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.state==0){
						$.messager.alert('警告',data.msg,'info'); 
					}
					if(data.state==1||data.state==2||data.state==3){
						$("#admin").tree({				
					url:"admin/adminmenu.json"
				});
					}
				}
			});
			
			$("#admin").tree({
				onClick: function(node){
					var title = node.text;
					var url = node.attributes.url;
					if($("#tt").tabs("exists",title)){
						$("#tt").tabs("select",title);
					}else{
						$("#tt").tabs("add",{
							title:title,
							closable:true,
							content:"<iframe src='"+url+"' style='width: 100%;height: 100%;' frameborder='0'></iframe>"
						});
					}
				}
			});
		});
    </script>

  </head>
  
  <body>
    <div id="cc" class="easyui-layout" data-options="fit:true">
    	<div data-options="region:'north',split:false" style="height: 102px;">
    		<!-- 头部  logo 登录信息 登录跳转
			================================================== -->
			<div class="container" >
			  <div style="height: 100px; background-color: #E0EEEE;">
			    <div style="height: 100px;float: left;">
			      <div style="height: 100px;float: left;">
			        <img alt="" src="images/logo.png" style="height: 60px;padding-top: 30px;">
			      </div>
			      <div style="height: 100px; float: right;">
			        <ul>
			          <li style="height: 15px;list-style: none;"></li>
			          <li style="height: 40px; list-style: none;">
			            <label style="font-size: 26px;font-family: 微软雅黑;">产学研合作信息平台</label><br>
			            <label style="font-size: 18px;font-family: 微软雅黑;">Industry-University-Research Cooperation</label>
			          </li>
			          <li style="height: 5px; list-style: none;"></li>
			        </ul>
			      </div>
			    </div>
			    <div style="height: 80px;float: right;margin-right: 10px;">
			      <div style="height: 45px;">
			      </div>
			      <div style="height: 35px;float: right;">
			        <ul >
			          <li style="float: left;list-style:none;">
			            <img class="img-circle" alt="头像" src="${user!=null? user.img :'images/timg.jpg'}" style="width: 30px;height: 30px;"/>
			          </li>
			          <li style="float: left;list-style:none; padding-top: 5px;">
			            <a href="login.jsp" id="LoginOrRegister" style="height: 30px; font-size:14px; padding-right: 5px; padding-left: 5px; font-family: 微软雅黑;text-align: center;">${user!=null? user.uname :"登录"}</a>
			          </li>
			          <li style="float: left;list-style:none;padding-top: 5px;">
			            <a href="user/logout" style="height: 30px; font-size: 14px;padding-right: 5px; font-family: 微软雅黑;text-align: center;">注销</a>
			          </li>
			          <li style="float: left;list-style:none;padding-top: 5px;">
			            <a href="#" style="height: 30px;font-size: 14px;padding-right: 5px; font-family: 微软雅黑;text-align: center;">个人中心</a>
			          </li>
			        </ul>
			      </div>
			    </div>
			  </div>
			</div>
    	</div>
    	<div data-options="region:'south',title:''" style="height:60px;background-color: #E0EEEE">
    		<center><p>广西师范大学&copy; 2019 CopyRight <a  href="index.jsp" target="_blank" style="float: right; padding-right: 15px;">返回首页</a></p></center>
    	</div>
    	<div data-options="region:'west',title:'目录',split:false" style="width: 150px;">
    		<ul id="admin"></ul>
    	</div>
    	<div data-options="region:'center'">
    		<div id="tt" class="easyui-tabs" data-options="fit:true,border:false">
    			<div data-options="title:'欢迎界面',closable:true">
    				<center style="font-size: 24px;">欢迎使用产学研合作信息后台管理系统</center>
    			</div>
    		</div>
    	</div>
    </div>
  </body>
</html>
