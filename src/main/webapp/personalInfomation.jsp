<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ include file="commons.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人详细信息</title>
    
  </head>
  
  <body> 	
  		<table>
	    	<tr >
	    		<td>用户名：</td>
	    		<td><input type="text" name="uname"  value="${user.uname }"/></td>
	    	</tr>
	    	<tr>
	    		<td>登陆账号：</td>
	    		<td><input type="text" name="username"  value="${user.username }"/></td>
	    	</tr>
	    	<tr>
	    		<td>头像：</td>
	    		<td><img alt="头像" src="${user.img }" style="width: 50px;height: 50px;"/></td>
	    	</tr>
	    	<tr>
	    		<td>用户类型：</td>
	    		<td><input type="text" name="userType"  value="${user.userType }"/></td>
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
	    		<td><input type="text" name="sex"  value="${user.sex }"/></td>
	    	</tr>
	    	<tr>
	    		<td>年龄：</td>
	    		<td><input type="text" name="age"  value="${user.age }"/></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期：</td>
	    		<td><input type="text" name="birthday"  value="<fmt:formatDate  pattern="yyyy-MM-dd"   value="${user.birthday }" type="both"/>"/></td>
	    	</tr>
	    	<tr>
	    		<td>所属单位：</td>
	    		<td><input type="text" name="unitId"  value="${user.unitId }"/></td>
	    	</tr>
	    	<tr>
	    		<td>注册时间：</td>
	    		<td><input type="text" name="createTime"  value="<fmt:formatDate value="${user.createTime }" type="both"/>"/></td>
	    	</tr>
	    	<tr>
	    		<td>qq邮箱：</td>
	    		<td><input type="text" name="qqEmail"  value="${user.qqEmail }"/></td>
	    	</tr>
	    	<tr>
	    		<td>微信账号：</td>
	    		<td><input type="text" name="weChat"  value="${user.weChat }"/></td>
	    	</tr>
	    	<tr>
	    		<td>用户状态：</td>
	    		<td><input type="text" name="state"  value="${user.state }"/></td>
	    	</tr>
	    </table>
	       
  </body>
</html>
