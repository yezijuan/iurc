<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的关注</title>

    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<style>
		td {
		      white-space:nowrap;overflow:hidden;text-overflow: ellipsis;
		}
	</style>
	
	<script type="text/javascript">
		//加载数据
		$(function(){
			$.ajax({
				url:"attention/myAttention",
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					var attention = json.attention;
					if(attention!=null){
						$.each(attention,function(i){
							var u = attention[i];
							console.log(u);
							var user = u.users[0];
							$("#attention").append(
								'<tr><td>'+
								user.uname+
								'</td><td>'+
								user.userType+
								'</td><td>'+
								user.sex+
								'</td><td>'+
								user.phone+
								'</td><td>'+
								user.address+
								'</td><td>'+
								user.weChat+
								'</td><td>'+
								user.qqEmail+
								'</td><td>'+
								u.createTime+
								'</td></tr> '
							);
						});
					}
				}
			});
		});
	</script>

  </head>
  
  <body>
   	<div class="row" style="width: 100%;">
		<div class="col-md-12">
			<div class="panel panel-default" id="show">
				  <div class="panel-heading"></div>
				  <table class="table table-hover" style="table-layout: fixed;" id="attention">
				  <tr onselectstart="return false" onselect="document.selection.empty()">
					<th>用户名</th>
					<th>用户类型</th>
					<th>用户性别</th>
					<th>联系电话</th>
					<th>联系地址</th>
					<th>微信账号</th>
					<th>邮箱账号</th>
					<th>关注时间</th>
				 </tr>
				</table>
				</div>
		</div>
	</div>
  </body>
</html>
