<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    <title>新闻资讯</title>
	
	<!--基础样式包-->
	<!--easyui主题包-->
	<link rel="stylesheet" type="text/css" href="/iurc1.1/jquery-easyui-1.5.5.2/themes/gray/easyui.css">
	<!--图标包-->   
	<link rel="stylesheet" type="text/css" href="/iurc1.1/jquery-easyui-1.5.5.2/themes/icon.css">  
	<!--引入jquery--> 
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.min.js"></script>   
	<!--引入easyui环境-->
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/iurc1.1/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>    
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$('#latestNewsTable').datagrid({    
		    url:'news/queryNews?type=0',    
		    columns:[[    
		        {field:'id',hidden:true},
		        {field:'title',title:'标题',width:312},        
		        {field:'reportTime',title:'发布时间',width:150}
		    ]],
		    onDblClickRow: function (rowIndex, rowData){//easyui封装好的事件
		    	var url = "news/findNews?id="+rowData.id;
           		window.open(url,'_blank'); 
		    }
		}); 
    });
    
 	$(function(){
 		queryNews('cooperationTable',1);
 		queryNews('technologyTable',2);
 	 });
 	function queryNews(id,type){
 		$('#'+id).datagrid({    
		    url:'news/queryNews?type='+type,    
		    columns:[[ 
		    	{field:'id',hidden:true},   
		        {field:'title',title:'标题',width:455},        
		        {field:'reportTime',title:'发布时间',width:160}
		    ]],
		    onDblClickRow: function (rowIndex, rowData){//easyui封装好的事件
		    	var url = "news/findNews?id="+rowData.id;
           		window.open(url,'_blank'); 
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
                        <img class="img-circle" alt="头像" src="${user!=null? user.img :'images/timg.jpg'}" style="width: 50px;height: 50px;"/>
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
                        <li class="active"><a href="NewsInformation.jsp">新闻资讯</a></li>
                        <li><a href="Abutment.jsp" >产学研对接</a></li>
                        <li><a href="CooperationAssociation.jsp" >技术转移联盟</a></li>
                        <li><a href="TechnologyCommunity.jsp" >技术社区</a></li>
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

<!-- 新闻展示
================================================== -->
<div class="container">
    <!-- 最新资讯
         ================================================== -->
    <div style="width: 400px;height: 300px; float: left;">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" >
            <!--  轮播指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播内部（项目） -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/item1.jpg" alt="First slide" >
                    <div class="container">
                        <!-- 轮播字幕 -->
                        <div class="carousel-caption">
                            <h4>第十二届中国产学研合作创新大会在北京举行</h4>
                            <p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="images/tiem2.jpg" alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h4>鄂州职业大学再添一产学研合作基地</h4>
                            <p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="images/item3.jpeg" alt="Third slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h4>新能源汽车融合大数据 产学研加快技术革新</h4>
                            <p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 左右轮播导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!-- 最新动态中间
             ================================================== -->
    <div style="width: 500px; float: left;margin-left: 20px;">
        <div class="panel panel-default" style="height: 300px;" >
            <div class="panel-body" style="padding-bottom: 5px;">
                <p class="pull-right" style="margin-top: 25px;"><a href="#">更多 >></a> </p>
                <p style="font-size: 18px;">最新资讯</p>
            </div>
            <table id="latestNewsTable" style="margin-bottom: 0;" ></table>
        </div>
    </div>
    <!-- 右边
         ================================================== -->
    <div style="width: 200px; float: left;margin-left: 20px;">
        <div class="panel panel-default">
            <div class="panel-body" style="padding-bottom: 5px;">
                <p style="font-size: 18px;">学习园地</p>
            </div>
            <table class="table">
                <tr>
                    <td>
                        <a href="#">学习园地</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Action</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#">Action</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="container marketing">
        <!-- 水平线 -->
        <hr class="featurette-divider" style="margin-top: 350px;">
        <!-- 合作动态
                 ================================================== -->
        <div class="row featurette">
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-body" style="padding-bottom: 5px;">
                        <p class="pull-right" style="margin-top: 25px;"><a href="#">更多 >></a> </p>
                        <p style="font-size: 18px;">合作动态</p>
                    </div>
                    <table id="cooperationTable"></table>
                </div>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-responsive center-block" src="images/0857002635b7194870bc3d.jpg" alt="Generic placeholder image" height="500">
            </div>
        </div>
    </div>

    <hr class="featurette-divider">
    <!-- 科技动态
             ================================================== -->
    <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
            <div class="panel panel-default">
                <div class="panel-body" style="padding-bottom: 5px;">
                    <p class="pull-right" style="margin-top: 25px;"><a href="#">更多 >></a> </p>
                    <p style="font-size: 18px;">科技动态</p>
                </div>
                <table id="technologyTable"></table>
            </div>
        </div>
        <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-responsive center-block" src="images/2019032810520312249.jpg" alt="Generic placeholder image" height="300">
        </div>
    </div>

    <hr class="featurette-divider">

    <footer>
        <div style="text-align: center;margin-bottom: 20px;">
            <p class="pull-right"><a href="#">返回顶部</a></p>
            <p>广西师范大学&copy; 2019 CopyRight</p>
        </div>
    </footer>
</div>

</div>


</body>
</html>
