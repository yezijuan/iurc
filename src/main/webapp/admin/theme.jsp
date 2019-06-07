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
    <script type="text/javascript" src="admin/js/theme.js"></script>
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
    				<td class="label">标题：</td>
    				<td><input type="text" name="title" class="easyui-textbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">内容：</td>
    				<td>
    					<div class="form-group">
						    <textarea rows="3" cols="20" name="content" style="width: 400px; height: 100px;"></textarea>
					  	</div>
					</td>
    			</tr> 
    			<tr>
    				<td class="label">发表时间：</td>
    				<td><input type="text" name="deliverTime" class="easyui-datetimebox" ></td>
    			</tr>
    			<tr>
    				<td class="label">用户：</td>
    				<td><input type="text" name="uid" class="easyui-numberbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">状态：</td>
    				<td><input type="text" name="state" class="easyui-numberbox" ></td>
    			</tr> 	 			
    		</table>
    	</form>
    </div>
    
  </body>
</html>
