<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
				            ' &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="attention('+theme[i].uid+')">加关注</a><hr>'+          
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
	    
	    $(document).ready(function(){
		  $("#more").click(function(){
		  	//分页查询的下一页
		    $("#bolg").append(" <b>Hello world!</b>");
		  });
		});
    
   		 //点击标题超链接，发送查询该主题的详细信息，并跳转到themeInfo.jsp页面
        function themeInfo(id){
        	var url = "theme/findTheme?id="+id;
			window.open(url,'_blank');
     	}
     	//点击发表人编号超链接，关注该用户
        function attention(id){
        	var url = "user/attention?id="+id;
			$.ajax({
				type:'post',
				url:url,
				dataType:'json',
				success:function(result){
					if(result.state==1){//关注成功
						alert("消息提示："+result.msg);
					}else{
						alert("消息提示："+result.msg);
					}	
					
				}
			});
     	}
    
    </script>


</head>
<body>
<!-- 头部  logo 登录信息 登录跳转
================================================== -->
<div class="container">
    <div style="height: 150px; background-color: #E0EEEE;">
        <div style="height: 150px;float: left;">
            <div style="height: 150px;float: left;">
                <img alt="" src="images/logo.png" style="height: 80px;margin-top: 40px;">
            </div>
            <div style="height: 150px; float: right;">
                <ul>
                    <li style="height: 50px;list-style: none;"></li>
                    <li style="height: 70px; list-style: none;">
                        <label style="font-size: 26px;font-family: 微软雅黑;">产学研合作信息平台</label><br>
                        <label style="font-size: 18px;font-family: 微软雅黑;">Industry-University-Research Cooperation</label>
                    </li>
                    <li style="height: 30px; list-style: none;"></li>
                </ul>
            </div>
        </div>
        <div style="height: 150px;float: right;">
            <div style="height: 100px;">
            </div>
            <div style="height: 50px;float: right;">
                <ul >
                    <li style="float: left;list-style:none;">
                        <img class="img-circle" alt="头像" src="${(user!=null&&user.img!='')? user.img :'images/timg.jpg'}" style="width: 50px;height: 50px;"/>
                    </li>
                    <li style="float: left;list-style:none; padding-top: 15px;">
                        <a href="login.jsp" id="LoginOrRegister" style="height: 50px; font-size:14px; padding-right: 5px; padding-left: 5px; font-family: 微软雅黑;text-align: center;">${user!=null? user.uname :"登录"}</a>
                    </li>
                    <li style="float: left;list-style:none;padding-top: 15px;">
                        <a href="user/logout" style="height: 50px; font-size: 14px;padding-right: 5px; font-family: 微软雅黑;text-align: center;">注销</a>
                    </li>
                    <li style="float: left;list-style:none;padding-top: 15px;">
                        <a href="personalCenter.jsp" style="height: 50px;font-size: 14px;padding-right: 5px; font-family: 微软雅黑;text-align: center;">个人中心</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 导航栏  搜索框
================================================== -->
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container" >
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="NewsInformation.jsp">新闻资讯</a></li>
                        <li><a href="Abutment.jsp" >产学研对接</a></li>
                        <li><a href="CooperationAssociation.jsp" >技术转移联盟</a></li>
                        <li class="active"><a href="TechnologyCommunity.jsp">技术社区</a></li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav">
                        <li style="float: left;list-style:none;"></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">研究背景</a></li>
				                <li><a href="#">研究现状</a></li>
				                <li><a href="#">加入我们</a></li>
				                <li role="separator" class="divider"></li>
				                <li class="dropdown-header"></li>
				                <li><a href="#">联系我们</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>

    </div>
</div>

<!-- 中部   主题信息  帖子
================================================== -->
<div class="container">

      <div class="row">
        <div class="col-sm-8 blog-main">
        
          <div class="blog-post" id="bolg">
                    
          </div><!-- /.blog-post -->
          
          <nav>
            <ul class="pager">
              <li><a href="javascript:void(0);" id="more">更多....</a></li>
            </ul>
          </nav>

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>主题</h4>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户在技术社区，可以发表和回复对产学研相关的各类信息或技术的观点和看法，大家互相交流，增强互动性，丰富平台的内容。</p>
          </div>
          <div class="sidebar-module">
            <h4>更多主题</h4>
            <ol class="list-unstyled">
              <li><a href="#">收藏量</a></li>
              <li><a href="#">阅读量</a></li>
              <li><a href="#">作者</a></li>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

	<hr class="featurette-divider">
	 <footer>
        <div style="text-align: center;margin-bottom: 20px;">
            <p class="pull-right"><a href="#">返回顶部</a></p>
            <p>广西师范大学&copy; 2019 CopyRight</p>
        </div>
    </footer>


</div><!-- /.container -->
	


</body>
</html>
