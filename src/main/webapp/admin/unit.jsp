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
    <script type="text/javascript" src="admin/js/unit.js"></script>
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
    				<td class="label">单位名称：</td>
    				<td><input type="text" name="unitName" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">代理人：</td>
    				<td><input type="text" name="uid" class="easyui-numberbox" ></td>
    			</tr>  
    			<tr>
    				<td class="label">单位简介：</td>
    				<td><input type="text" name="introduction" class="easyui-textbox"></td>
    			</tr>  
    			<tr>
    				<td class="label">联系电话：</td>
    				<td><input type="text" name="phone" class="easyui-textbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">联系地址：</td>
    				<td><input type="text" name="address" class="easyui-textbox" ></td>
    			</tr>  			
    			<tr>
    				<td class="label">单位类型：</td>
    				<td>
    					<select class="easyui-combobox" name="unitType" style="width:153px;">   
						    <option value="1">企业</option>   
						    <option value="2">高校</option>
						    <option value="3">科研</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td class="label">行业领域：</td>
    				<td><input type="text" name="industryField" class="easyui-textbox"></td>
    			</tr>
    			<tr>
    				<td class="label">发展优势：</td>
    				<td><input type="text" name="advantage" class="easyui-textbox"></td>
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
    	<input type="hidden" name="id">
    	<table style="float: left;">
    			<tr>
    				<td class="label">单位名称：</td>
    				<td><input type="text" name="unitName" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">代理人：</td>
    				<td><input type="text" name="uid" class="easyui-numberbox" readonly="readonly"></td>
    			</tr>  
    			<tr>
    				<td class="label">单位简介：</td>
    				<td><input type="text" name="introduction" class="easyui-textbox" readonly="readonly"></td>
    			</tr>  
    			<tr>
    				<td class="label">联系电话：</td>
    				<td><input type="text" name="phone" class="easyui-textbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">联系地址：</td>
    				<td><input type="text" name="address" class="easyui-textbox" readonly="readonly"></td>
    			</tr>  			
    			<tr>
    				<td class="label">单位类型：</td>
    				<td>
    					<select class="easyui-combobox" name="unitType" style="width:153px;" readonly="readonly" >   
						    <option value="1">企业</option>   
						    <option value="2">高校</option>
						    <option value="3">科研</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td class="label">行业领域：</td>
    				<td><input type="text" name="industryField" class="easyui-textbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">发展优势：</td>
    				<td><input type="text" name="advantage" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">状态：</td>
    				<td><input type="text" name="state" class="easyui-numberbox" readonly="readonly"></td>
    			</tr> 			
    		</table>
		</fieldset>
    	</form>
    	</center>
    </div>
  </body>
</html>
