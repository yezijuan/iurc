<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commons.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>主题详情</title>

	
    <!-- Bootstrap 外部样式连接   -->    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
  	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		function collect(id){
			$.ajax({
				url:"theme/collect?id="+id,
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.state==1){
						alert('消息提示：'+data.msg);
						location.replace(location.href);
					}else{
						alert('消息提示：'+data.msg);    
					}
				}
			});
		}
		
		
		
		//查询该主题的回复情况(主题编号)
		$(function(){
			var id = $("#themeId").val();
	    	$.ajax({
				url:"theme/queryReplyByThemeId?id="+id,
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json.state){
						var reply=json.reply;
						$.each(reply,function(i){
							$("#reply").append(
			    				'<div class="blog-post"><h4 class="blog-post-title">'+
			    				reply[i].uid+
			    				'@'+
			    				reply[i].reUserId+
			    				'</h4><p class="blog-post-meta">'+
			    				reply[i].replyTime+
			    				'</p><hr><blockquote><p style="font-size: 14px;">'+
			    				reply[i].content+
			    				'</p></blockquote><div><ul class="nav nav-tabs" role="tablist"><li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">'+
			    				'回复'+
			    				'</a></li></ul><div class="tab-content"><div role="tabpanel" class="tab-pane active" id="home"><form id="r'+
			    				reply[i].id+
			    				'"><textarea name="content"  class="form-control" id="content'+
			    				reply[i].id+
			    				'" rows="1" style="overflow-y:visible"></textarea><button type="submit" class="btn btn-default" style="margin: 10px;" onclick="reply('+
			    				reply[i].id+
			    				')">Submit</button><input name="themeId" id="themeId'+
			    				reply[i].id+
			    				'" hidden="true"  value="'+
			    				reply[i].themeId+
			    				'"/><input name="reUserId" id="reUserId'+
			    				reply[i].id+
			    				'" hidden="true"  value="'+
			    				reply[i].uid+
			    				'"/></form></div></div></div></div>'
			    			);
			    			
							});
					
					}
				}
			});
	    	
	    });
	    
     //折叠面板的隐藏与显示
     $(function () { $('#collapseOne').collapse('hide');});
     
     //回复主题处理
     function reTheme(){
     	var f = $('#reTheme');
		var data = f.serialize();
     	$.ajax({
				url:"reply/reTheme",
				type:"post",
				data:data,
				dataType:"json",
				success:function(data){
					console.log(data);
					if(data.state){
						alert('消息提示：'+data.msg);
						location.replace(location.href);
					}else{
						alert('消息提示：'+data.msg);
					}
				}
			});
     }
     //回复他人观点处理
     function reply(id){
     	var themeId = $("#themeId"+id).val();
     	var reUserId = $("#reUserId"+id).val();
     	var content = $("#content"+id).val();
	//	var data = f.serialize();
     	$.ajax({
				url:"reply/reTheme",
				type:"post",
				data:{"themeId":themeId,"reUserId":reUserId,"content":content},
				dataType:"json",
				success:function(data){
					console.log(data);
					if(data.state){
						alert('消息提示：'+data.msg);
						location.replace(location.href);
					}else{
						alert('消息提示：'+data.msg); 
					}
				}
			});
     }
     
	</script>

  </head>
  
  <body> 
    <div class="container">
    	<div class="page-header" style="text-align: center;">
    	 <!-- 水平线 -->
   		 <hr class="featurette-divider">
   		 	<div style="text-align: left;">
   		 		<p style="font-size: 30px;">THEME INFORMATION</p>
  				<p style="font-size: 20px;">主题详情</p>
  			</div>
  			<h1 style="font-size: 20px;">${theme.title }</h1>
  			<div style="text-align:left;">
  				<label>发布时间：${theme.deliverTime }</label>
  				<label>&nbsp;&nbsp;&nbsp;&nbsp;作者编号：${theme.uid }</label>
  				<label id="cc">&nbsp;&nbsp;&nbsp;&nbsp;收藏量：</label>
  				<button class="btn btn-default" style="float: right;" onclick="collect('${theme.id }')">收藏</button>
  				<input hidden="true" id ="themeId" value="${theme.id }"/>
  			</div>
  			<hr class="featurette-divider">
  			<div style="text-align:left;">
  				<p class="navbar-text" >${theme.content }</p>
  			</div>
  			
  			<!-- 水平线 -->
   		 	<hr class="featurette-divider">
  			<!-- 回复内容详情 动态显示  面板-->
  			<div>
				
				<div class="panel-group" id="accordion">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseOne">回复详情
				         </a>
				      </h4>
				    </div>
				    <div id="collapseOne" class="panel-collapse collapse">
				      <div class="panel-body" id="reply">
				            
				      </div>
				    </div>
				  </div>
				 </div>
				 <!-- 回复 -->
				<div>
					<form id="reTheme">
						<textarea name="content"  class="form-control" name="content" rows="3" style="overflow-y:visible"></textarea>
						<button type="submit" class="btn btn-default" style="margin: 10px;" onclick="reTheme()">Submit</button>
						<input name="themeId" hidden="true"  value="${theme.id }"/>
						<input name="reUserId" hidden="true"  value="${theme.uid }"/>
					</form>
			   </div>
			</div>
		</div>	
	    
    </div>
    <footer>
	    <div class="container">
	 	 <div style="height: 50px;">	
		      <div style="text-align: center;">
		        <p>广西师范大学&copy; 2019 CopyRight</p>
		      </div>
	
	  	 </div>
	  </div>
  </footer>
  </body>
</html>
