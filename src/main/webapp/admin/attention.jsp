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
    <script type="text/javascript" src="admin/js/attention.js"></script>
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
    				<td class="label">用户：</td>
    				<td><input type="text" name="uid" class="easyui-numberbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">关注用户：</td>
    				<td><input type="text" name="aid" class="easyui-numberbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">关注时间：</td>
    				<td><input type="text" name="createTime" class="easyui-datetimebox" ></td>
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
   				<td class="label"></td>
   				<td><input type="text" name="Id" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label"></td>
   				<td><input type="text" name="userId" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label"></td>
   				<td><input type="text" name="nuitType" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label"></td>
   				<td><input type="text" name="address" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label"></td>
   				<td><input type="text" name="phone" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label"></td>
   				<td><input type="text" name="industryField" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
    		<tr>
   				<td class="label">单位名称：</td>
   				<td><input type="text" name="nuitName" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label">单位简介：</td>
   				<td><input type="text" name="introduction" class="easyui-textbox" readonly="readonly"></td>
   			</tr>
   			<tr>
   				<td class="label">发展优势：</td>
   				<td><input type="text" name="advantage" class="easyui-datebox" readonly="readonly"></td>
   			</tr>
		</table>
		</fieldset>
    	</form>
    	</center>
    </div>
  </body>
</html>
