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
    
    <title>修改个人信息</title>
    
  </head>
  
  <body>
    <form action="user/editPersonalInformation" method="post">
    	<table>
	    	<tr >
	    		<td>用户名：</td>
	    		<td><input type="text" name="uname"  value="${user.uname }"/></td>
	    	</tr>
	    	<tr>
	    		<td>联系电话：</td>
	    		<td><input type="text" name="phone"  value="${user.phone }"/></td>
	    	</tr>
	    	<tr>
	    		<td>联系地址：</td>
	    		<td><input type="text" name="address"  value="${user.address }"/></td>
	    	</tr>
	    	<tr>
	    		<td>性别：</td>
	    		<td>
    				<select class="easyui-combobox" name="sex" style="width:153px;">   
					    <option value="1">男</option>   
					    <option value="0">女</option>
					</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>年龄：</td>
	    		<td><input type="text" name="age"  value="${user.age }"/></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期：</td>
	    		<td><input type="text" class="easyui-datebox" name="birthday"  value="${user.birthday }"/></td>
	    	</tr>
	    	<tr>
	    		<td>所属单位：</td>
	    		<td>
	    			<select class="easyui-combobox" name="unitId" style="width:153px;"
	    				data-options="valueField:'id',textField:'unitName',url:'unit/findAllUnit'">   
					</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>qq邮箱：</td>
	    		<td><input type="text" name="qqEmail"  value="${user.qqEmail }"/></td>
	    	</tr>
	    	<tr>
	    		<td>微信账号：</td>
	    		<td><input type="text" name="weChat"  value="${user.weChat }"/></td>
	    	</tr>
	    </table>
	    <br>
	    <input type="submit"   value="确认修改"/>
    </form>
  </body>
</html>
