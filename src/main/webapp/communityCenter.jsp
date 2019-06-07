<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <title>技术社区</title>

  <!-- Bootstrap 外部样式连接   -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
  <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
  <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	 $(function(){
	    	ajax();
	    });
	    
	    var ajax = function(){
			$.ajax({
			type:'get',//请求方式
			url:'theme/queryThemeByPage', // AJAX HTTP请求接口
			data:'',//提交到服务器接口的参数 比如'{cid:1}'，结果为***.jsp?cid=1格式
			dataType:'json',//请求类型为json, 更多见jquery doc文档
			timeout:7000,//请求超时后停止请求
			success: function(json){
				console.log(json);
				if(json.state){
					var theme=json.theme;
					$.each(theme,function(i){
						$("#bolg").append(
		    				'<div class="blog-post">'+
				            '<h4 class="blog-post-title"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> &nbsp;&nbsp;<a href="javascript:void(0);" onclick="themeInfo('+theme[i].id+')">'+
				             theme[i].title+
				            '</a></h4>'+
				            '<p class="blog-post-meta">发表时间：'+
				            theme[i].deliverTime+
				            ' &nbsp;&nbsp;&nbsp;&nbsp;发表人编号：'+
				            theme[i].uid+
				            '<hr>'+          
				            '<blockquote><p style="font-size: 14px;">'+
				              theme[i].content +
				              '</p></blockquote><p>评论： '+
				            theme[i].id +
				            '&nbsp;&nbsp;&nbsp;&nbsp;收藏：'+
				            theme[i].id +
				            '</p></div>'
		    			);
		    			
						});
				
				}
				
				}
			});
	    };
	    
	    
	    //初始化分页查询的请求参数（把数据保存在当前页）
	    
	     
	    $(document).ready(function(){
		  $("#more").click(function(){
		  	//分页查询的下一页
		    $("#bolg").append(" <b>查询结果追加显示</b>");
		  });
		});
    
    //点击标题超链接，发送查询该主题的详细信息，并跳转到themeInfo.jsp页面
        function themeInfo(id){
        	var url = "theme/findTheme?id="+id;
			window.open(url,'_blank');
     	}
    
  </script>
  
</head>
  
<body>
    <!-- 主题
================================================== -->
<div class="container">
    <div class="row">
        <div class="col-sm-12 blog-main">
        
          <div class="blog-post" id="bolg">
                    
          </div><!-- /.blog-post -->
          
          <nav>
            <ul class="pager">
              <li><a href="javascript:void(0);" id="more">更多....</a></li>
            </ul>
          </nav>

        </div><!-- /.blog-main -->
      </div><!-- /.row -->
    
</div>


</body>
</html>
