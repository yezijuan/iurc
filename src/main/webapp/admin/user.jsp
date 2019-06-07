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
    
    <title>用户</title>
    <script type="text/javascript" src="admin/js/user.js"></script>	
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
    <table id="dg"></table>
    <div id="dd" class="easyui-dialog"  closed="true">
    	<form id="ff" method="post">   
    			<input type="hidden" name="id"  />
    		<table style="float: left;">
    			<tr>
    				<td class="label">姓名：</td>
    				<td><input type="text" name="uname" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">账号：</td>
    				<td><input type="text" name="username" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">密码：</td>
    				<td><input type="password" name="password" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">类型：</td>
    				<td><input type="text" name="userType" class="easyui-textbox"></td>
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
    				<td class="label">性别：</td>
    				<td>
    					<select class="easyui-combobox" name="sex" style="width:153px;">   
						    <option value="1">男</option>   
						    <option value="0">女</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td class="label">年龄：</td>
    				<td><input type="text" name="age" class="easyui-numberbox"></td>
    			</tr>
    			  			
    		</table>
    		<table style="float: left;">
    			
    			<tr>
    				<td class="label">头像：</td>
    				<td><input type="text" name="img" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">单位：</td>
    				<td>
    					<select class="easyui-combobox" name="unitId" style="width:153px;" data-options="valueField:'id',textField:'unitName',url:'unit/findAllUnit'">   
						   	
						</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<td class="label">邮箱：</td>
    				<td><input type="text" name="qqEmail" class="easyui-textbox"></td>
    			</tr>
    			<tr>
    				<td class="label">微信：</td>
    				<td><input type="text" name="weChat" class="easyui-textbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">状态：</td>
    				<td><input type="text" name="state" class="easyui-textbox" ></td>
    			</tr>
    			<tr>
    				<td class="label">生日：</td>
    				<td><input type="text" name="birthday" class="easyui-datebox" ></td>
    			</tr>
    			<tr>
    				<td class="label">创建时间：</td>
    				<td><input type="text" name="createTime" class="easyui-datetimebox" ></td>
    			</tr>
    		</table>
    	</form>
    </div>
    <div id="detail" class="easyui-dialog" style="width: 700px;height: 400px;" closed="true">
    	<center>
    	<form action="" id="df">
    	<fieldset>
    	<legend>详细信息</legend>
    	<table style="float: left;">
    			<tr>
    				<td class="label">姓名：</td>
    				<td><input type="text" name="uname" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">账号：</td>
    				<td><input type="text" name="username" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">密码：</td>
    				<td><input type="password" name="password" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">类型：</td>
    				<td><input type="text" name="userType" class="easyui-textbox" readonly="readonly"></td>
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
    				<td class="label">性别：</td>
    				<td>
    					<select class="easyui-combobox" name="sex" style="width:153px;" readonly="readonly">   
						    <option value="1">男</option>   
						    <option value="0">女</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td class="label">年龄：</td>
    				<td><input type="text" name="age" class="easyui-numberbox" readonly="readonly"></td>
    			</tr>
    			  			
    		</table>
    		<table style="float: left;">
    			<tr>
    				<td class="label">头像：</td>
    				<td><input type="text" name="img" class="easyui-textbox" readonly="readonly"></td>
    			</tr> 
    			<tr>
    				<td class="label">单位：</td>
    				<td><input type="text" name="unitId" class="easyui-numberbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">邮箱：</td>
    				<td><input type="text" name="qqEmail" class="easyui-textbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">微信：</td>
    				<td><input type="text" name="weChat" class="easyui-textbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">状态：</td>
    				<td><input type="text" name="state" class="easyui-textbox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">生日：</td>
    				<td><input type="text" name="birthday" class="easyui-datebox" readonly="readonly"></td>
    			</tr>
    			<tr>
    				<td class="label">创建时间：</td>
    				<td><input type="text" name="createTime" class="easyui-datetimebox" readonly="readonly"></td>
    			</tr>
    		</table>
		</fieldset>
    	</form>
    	</center>
    </div>
  </body>
</html>
