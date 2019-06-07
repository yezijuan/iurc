<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <style type="text/css">
    	input{
    		width: 50px;
    		height: 30px;
    	}
    	
    	table td {
    		text-align: left;
    		padding-right: 5px;
    		border: 1px;
    		border-color: gray;
    	}
    </style>
    <script type="text/javascript">
    	$(function(){
    		var id = document.getElementById("id").value;
			$.ajax({
				url:'unit/queryAgentInfo?id='+id,
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.state==1){
						location.reload();
					}else{
						$.messager.alert('警告',data.msg,'info');    
					}
				}
			});
    	});
    
    </script>
  </head>
  
  <body>
  <input id="id" type="hidden" value="${user.id }">
    <center>
    	<form action="" id="df">
    	<fieldset>
    	<legend>单位详细信息</legend>
    	<table>
    		<tr>
    		<th>编号</th>
			<th>单位名称</th>
			<th>单位简介</th>
			<th>发展优势</th>
			<th>行业领域</th>
			<th>联系电话</th>
			<th>联系地址</th>
			<th>单位类型</th>
			<th>状态</th>
			</tr>
   			<tr>
   				<td>${unit.id }</td>
   				<td>${unit.unitName }</td>
   				<td style="width: 300px;">${unit.introduction }</td>
   				<td style="width: 300px;">${unit.advantage }</td>
   				<td style="width: 200px;">${unit.industryField }</td>
   				<td>${unit.phone }</td>
   				<td>${unit.address }</td>
   				<td>${unit.unitType }</td>
   				<td>${unit.state }</td>
   			</tr>    
    		</table>
		</fieldset>
		<fieldset>
    	<legend>代理人详细信息</legend>
    	<table style="float: left;">
    		<tr>
    		<th>头像</th>
    		<th>编号</th>
			<th>姓名</th>
			<th>账号</th>
			<th>密码</th>
			<th>类型</th>
			<th>联系电话</th>
			<th>联系地址</th>
			<th>性别</th>
			<th>年龄</th>
			<th>单位编号</th>
			<th>邮箱</th>
			<th>微信</th>
			<th>状态</th>
			<th>生日</th>
			<th>创建时间</th>
			</tr>
			<c:forEach items="${unit.users}" var="user">
   			<tr>
   				<td><img src="${user.img }" width="100" height="100"></td>
   				<td>${user.id }</td>
   				<td>${user.uname }</td>
   				<td>${user.username }</td>
   				<td><input type="password" value="${user.password }" readonly="readonly"></td>
   				<td>${user.userType }</td>
   				<td>${user.phone }</td>
   				<td>${user.address }</td>
   				<td>${user.sex==1 ? "男":"女" }</td>
   				<td>${user.age }</td>
   				<td>${user.unitId }</td>
   				<td>${user.qqEmail }</td>
   				<td>${user.weChat }</td>
   				<td>${user.state }</td>
   				<td style="width: 100px;"><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" /></td>
   				<td>${user.createTime }</td>
   			</tr> 
   			</c:forEach>   
    		</table>
		</fieldset>
    	</form>
    	
    </center>
  </body>
</html>
