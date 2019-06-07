<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
    <title>技术转移联盟</title>

    <!-- Bootstrap 外部样式连接   -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
 
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
                        <li ><a href="index.jsp">首页</a></li>
                        <li><a href="NewsInformation.jsp">新闻资讯</a></li>
                        <li><a href="Abutment.jsp" >产学研对接</a></li>
                        <li class="active"><a href="CooperationAssociation.jsp" >技术转移联盟</a></li>
                        <li><a href="TechnologyCommunity.jsp">技术社区</a></li>
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
<!-- 技术转移联盟 主体部分
================================================== -->
<div class="container">
	<!-- 技术转移联盟 企业部分
	================================================== -->
	 <div class="row featurette">
	 	<h3 class="featurette-heading">企业 <span class="glyphicon glyphicon-equalizer" aria-hidden="true"></span></h3>
	 		<div class="panel-group" id="accordion">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseOne">联盟企业详情
				         </a>
				      </h4>
				    </div>
				    <div id="collapseOne" class="panel-collapse collapse">
				      <div class="panel-body" id="unit">
				      	 
				      </div>
				    </div>
				    
				 </div>
		 </div>
	      
    </div>
	

	<!-- 技术转移联盟 高校部分
	================================================== -->
	<div class="row featurette">
	 	<h3 class="featurette-heading">高校 <span class="glyphicon glyphicon-education" aria-hidden="true"></span></h3>
	 		<div class="panel-group" id="accordion">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseTwo">联盟企业详情
				         </a>
				      </h4>
				    </div>
				    <div id="collapseTwo" class="panel-collapse collapse">
				      <div class="panel-body" id="school">
				            
				      </div>
				    </div>
				    
				  </div>
				 </div>
    </div>

	<!-- 技术转移联盟 科研机构部分
	================================================== -->
	<div class="row featurette">
	 	<h3 class="featurette-heading">科研 <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span></h3>
	 		<div class="panel-group" id="accordion">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseThree">联盟企业详情
				         </a>
				      </h4>
				    </div>
				    <div id="collapseThree" class="panel-collapse collapse">
				      <div class="panel-body" id="research">
				            
				      </div>
				    </div>
				    
				  </div>
				 </div>
    </div>



</div><!-- /.container -->


<div class="container">
	<hr class="featurette-divider">
	 <footer>
        <div style="text-align: center;margin-bottom: 20px;">
            <p class="pull-right"><a href="#">返回顶部</a></p>
            <p>广西师范大学&copy; 2019 CopyRight</p>
        </div>
    </footer>
</div><!-- /.container -->
	

</body>

   <script type="text/javascript">
    	
		function queryUnit(unitType,id){
			$.ajax({
				url:"unit/queryUnit?unitType="+unitType,
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					if(json.state){
						var unit=json.unit;
						$.each(unit,function(i){
							var j =0;
						//	var size = unit[i].users.size();
							$("#"+id).append(
			    				'<div><div class="col-md-12"><center><h4>'+
			    				unit[i].unitName+
			    				'</h4></center><br class="lead"><h5>单位简介：</h5>'+
						        unit[i].introduction+
						        '</p></div><div class="col-md-12"><br class="lead"><h5>发展优势：</h5>'+
						        unit[i].advantage+
						        '</p></div><div class="col-md-12"><br class="lead"><h5>行业领域：</h5>'+
						        unit[i].industryField+
						        '</p></div><div class="row"><div class="col-md-4"><span class="glyphicon glyphicon-map-marker" aria-hidden="true">：'+
						        unit[i].address+
						        '</span></div><div class="col-md-4"><span class="glyphicon glyphicon-earphone" aria-hidden="true">：'+
						        unit[i].phone+
						        '</span></div><div class="col-md-4"><span class="glyphicon glyphicon-user" aria-hidden="true">：<c:forEach items="'+
						        unit[i].users+
						        '" var="user">'+
						        unit[i].users[j].uname+
						        '&nbsp;&nbsp;&nbsp;</c:forEach></span></div></div><hr class="featurette-divider"></div>'
						        
				    		);
			    			j++;
						});
					
					}
				}
			});
	    	
		}
		
	//事件
	$('#collapseOne').on("shown.bs.collapse", function() {
		console.log("shown1");
		queryUnit(1,'unit');
	});
	
	$('#collapseTwo').on("shown.bs.collapse", function() {
		console.log("shown2");
		queryUnit(2,'school');
	});
	
	$('#collapseThree').on("shown.bs.collapse", function() {
		console.log("shown3");
		queryUnit(3,'research');
	});
		
    </script>



</html>
