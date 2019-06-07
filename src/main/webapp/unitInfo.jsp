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
    <title>单位详情</title>

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
	
		function queryCooperation(){
			$.ajax({
				url:"cooperation/query",
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					
				}
			});
		}
		
		//加载数据
		$(function(){
			var url = location.search; //获取url中"?“符后的字串
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				unitType = decodeURIComponent(strs[0].replace("unitType=",""));//获取url中的unitType
			}
			$.ajax({
				url:"unit/findUnit?unitType="+unitType,
				type:"post",
				dataType:"json",
				success:function(json){
					console.log(json);
					var unit = json.units;
					if(unit!=null){
						$.each(unit,function(i){
							var u = unit[i];
							$("#unit").append(
								'<tr><td>'+
								u.id+
								'</td><td>'+
								u.unitName+
								'</td><td>'+
								u.introduction+
								'</td><td>'+
								u.advantage+
								'</td><td>'+
								u.industryField+
								'</td><td>'+
								u.phone+
								'</td><td>'+
								u.address+
								'</td><td>'+
								u.unitType+
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

<!-- 产学研对接  
================================================== -->
<div class="container"> 
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default" id="show">
				  <div class="panel-heading">单位类型</div>
				  <table class="table table-hover" style="table-layout: fixed;" id="unit">
				  <tr onselectstart="return false" onselect="document.selection.empty()">
		    		<th style="width: 50px;">编号</th>
					<th>单位名称</th>
					<th>单位简介</th>
					<th>发展优势</th>
					<th>行业领域</th>
					<th>联系电话</th>
					<th>联系地址</th>
					<th style="width: 80px;">单位类型</th>
					</tr>
				</table>
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
</html>
