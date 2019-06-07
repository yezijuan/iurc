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
    <script type="text/javascript" src="admin/js/news.js"></script>	
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
    <table id="ndg"></table>
    <div id="dd" class="easyui-dialog" closed="true">
    	<form id="ff" method="post">   
    			<input type="hidden" name="id"  />
    		<table style="float: left;">
    			<tr>
    				<td class="label">标题：</td>
    				<td><input type="text" name="title" class="easyui-textbox" style="width: 400px; height: 30px;"></td>
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
    				<td class="label">图片：</td>
    				<td><input type="text" name="picture" class="easyui-textbox" ></td>
    			</tr> 
    			<tr>
    				<td class="label">发布时间：</td>
    				<td><input type="text" name="reportTime" class="easyui-datetimebox"></td>
    			</tr>  
    			<tr>
    				<td class="label">作者：</td>
    				<td><input type="text" name="author" class="easyui-textbox" ></td>
    			</tr>			
    			<tr>
    				<td class="label">新闻类别：</td>
    				<td>
    					<select class="easyui-combobox" name="newsTypeId" style="width:153px;">   
						    <option value="1">合作</option>   
						    <option value="2">科技</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td class="label">阅读量：</td>
    				<td><input type="text" name="readCounts" class="easyui-numberbox" ></td>
    			</tr>  
    			<tr>
    				<td class="label">点赞量：</td>
    				<td><input type="text" name="praiseCounts" class="easyui-numberbox"></td>
    			</tr>
    			<tr>
    				<td class="label">收藏量：</td>
    				<td><input type="text" name="collectionCounts" class="easyui-numberbox" ></td>
    			</tr>  
    			<tr>
    				<td class="label">审核状态：</td>
    				<td><input type="text" name="checked" class="easyui-numberbox"></td>
    			</tr>  
    			<tr>
    				<td class="label">创建时间：</td>
    				<td><input type="text" name="createTime" class="easyui-datetimebox"></td>
    			</tr> 
    			<tr>
    				<td class="label">新闻状态：</td>
    				<td><input type="text" name="state" class="easyui-numberbox"></td>
    			</tr> 			
    		</table>
    	</form>
    </div>
    
  </body>
</html>
