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
    
    <title>单位</title>
    <script type="text/javascript" src="admin/js/project.js"></script>
    <style type="text/css">
    	input{
    		width: 200px;
    		height: 20px;
    	}
    	table td {
    		text-align: left;
    	}
    </style>
  </head>
  
  <body>
    <table id="udg"></table>
    <div id="dd" class="easyui-dialog"  closed="true">
    	<form id="ff" method="post">   
    			<input type="hidden" name="id"  />
    		<table style="float: left;">
    			<tr>
    				<td class="label">单位编号：</td>
    				<td><input type="text" name="unitId" class="easyui-numberbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">项目名称：</td>
    				<td><input type="text" name="projectName" class="easyui-textbox" ></td>
    			</tr>  
    			<tr>
    				<td class="label">项目内容：</td>
    				<td>
    					<div class="form-group">
						    <textarea rows="3" cols="20" name="projectContent" style="width: 400px; height: 100px;"></textarea>
					  	</div>
					</td>
    			</tr> 
    			<tr>
    				<td class="label">项目创建时间：</td>
    				<td><input type="text" name="projectFoundingTime" class="easyui-datetimebox" ></td>
    			</tr>
    			<tr>
    				<td class="label">状态：</td>
    				<td><input type="text" name="state" class="easyui-numberbox" ></td>
    			</tr> 			
    		</table>
    	</form>
    </div>
    <div id="detail" class="easyui-dialog" style="width: 400px;" closed="true">
    	<center>
    	<form action="" id="df">
    	<fieldset>
    	<legend>详细信息</legend>
    	<table>
    		<tr>
    			<td class="label" style="width: 200px;">项目名称：</td>
    			<td><input type="text" name="projectName" class="easyui-textbox" ></td>
    			</tr>  
    			<tr>
    				<td class="label">项目内容：</td>
    				<td>
    					<div class="form-group">
						    <textarea rows="3" cols="20" name="projectContent" style="width: 400px; height: 100px;"></textarea>
					  	</div>
					</td>
    			</tr> 
		</table>
		</fieldset>
    	</form>
    	</center>
    </div>
  </body>
</html>
