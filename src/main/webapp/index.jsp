<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="<%=basePath%>"/>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>产学研合作信息平台首页</title>

  <!-- Bootstrap 外部样式连接   -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
  <script type="text/javascript">
  		function findUnit(unitType){
			window.open("unitInfo.jsp?unitType="+unitType,'_blank'); 
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
            <li class="active"><a href="index.jsp">首页</a></li>
            <li><a href="NewsInformation.jsp">新闻资讯</a></li>
            <li><a href="Abutment.jsp" >产学研对接</a></li>
            <li><a href="CooperationAssociation.jsp" >技术转移联盟</a></li>
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
<!-- 轮播（Carousel）
================================================== -->
<div class="container">
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
        <img src="images/iurc_news1.jpg" alt="First slide">
        <div class="container">
          <!-- 轮播字幕 -->
          <div class="carousel-caption">
            <h2>第八届产学研合作创新大会</h2>
            <p>
              11月15日，第八届中国产学研合作创新大会在深圳隆重举行。</br>
            </p>
          </div>
        </div>
      </div>
      <div class="item">
        <img src="images/iurc_news2.jpg" alt="Second slide">
        <div class="container">
          <div class="carousel-caption">
            <h2>张家港江苏科技大学产学研合作洽谈会隆重召开</h2>
            <p>10月27日，张家港江苏科技大学产学研合作洽谈会在张家港市国贸酒店隆重举行。
            </p>
          </div>
        </div>
      </div>
      <div class="item">
        <img src="images/iurc_news3.jpg" alt="Third slide">
        <div class="container">
          <div class="carousel-caption">
            <h2>产学研合作驱动生态农业发展</h2>
            <p>产学研合作驱动生态农业发展现场会在延安召开</p>
          </div>
        </div>
      </div>
    </div>
    <!-- 轮播导航 -->
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
<!-- 三大主体介绍  详情连接
================================================== -->
<div class="container">
  <div class="container marketing">
    <div class="row" style="text-align: center; padding-top: 10px;">
      <div class="col-lg-4">
        <img class="img-circle" src="upload/iurc/unit.jpg" alt="Generic placeholder image" width="140" height="140">
        <h2>企业</h2>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; 在市场经济的前提下企业寻找更加适合企业发展的合作方式，以科研机构、高校的人才、研究成果输出作为企业发展的原动力。同时也为高校、研究机构提供研究和人才开发的利用资源。</p>
        <p><a class="btn btn-default" href="javascript:void(0);" role="button" onclick="findUnit('1')">详情 &raquo;</a></p>
      </div>
      <div class="col-lg-4">
        <img class="img-circle" src="upload/iurc/school.jpeg" alt="Generic placeholder image" width="140" height="140">
        <h2>高校</h2>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; 高校的人才培养能更加适应社会企业的需求，以高素质的专业人才来完成对行业内的转型需求。同时在人才产出的同时引进社会专业人才对高校的人才库进行充实。</p>
        <p><a class="btn btn-default" href="javascript:void(0);" role="button" onclick="findUnit('2')">详情 &raquo;</a></p>
      </div>
      <div class="col-lg-4">
        <img class="img-circle" src="upload/iurc/research.jpg" alt="Generic placeholder image" width="140" height="140">
        <h2>科研</h2>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; 借助社会企业的良好平台及资源，科研机构在技术上的开发的同时完成对研究方向的规划，以单纯的技术型研究机构转型成技术、方向性兼顾的研究结构，同时研究成果将推动企业以及行业的整体发展。</p>
        <p><a class="btn btn-default" href="javascript:void(0);" role="button" onclick="findUnit('3')">详情 &raquo;</a></p>
      </div>
    </div>

    <!-- 水平线 -->
    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">产学研合作 <span class="glyphicon glyphicon-grain" aria-hidden="true"></span></h2>
        <br class="lead">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        产学研合作是指企业、科研院所和高等学校之间的合作，通常指以企业为技术需求方与以科研院所或高等学校为技术供给方之间的合作，其实质是促进技术创新所需各种生产要素的有效组合。</br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        随着高校功能从人才培育、科学研究到社会服务的延伸，高等教育、科技、经济一体化的趋势越来越强。尤其是在知识经济社会中，大学将被推向社会发展的中心，成为社会经济发展的重要动力。
        以信息技术为标志的第三次科技革命对产学研合作起到了推波助澜的作用，其中，斯坦福大学对师生创业和建立学术界与产业界合作的积极支持，创造了“硅谷”的经济奇迹，
        使产学研合作在高新技术飞速发展的当今世界，成为推动经济和整个社会发展的一种最强劲的动力。
        </p>
      </div>
      <div class="col-md-5">
        <img class="featurette-image img-responsive center-block" src="images/iurc1.jpg" alt="Generic placeholder image">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 col-md-push-5">
        <h2 class="featurette-heading">产学研链 <span class="glyphicon glyphicon-grain" aria-hidden="true"></span></h2>
        <br class="lead">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        科研机构、高校和企业共性技术知识协同创新已成为创新体系建设关注热点。产学研协同创新服务链条不完整是科技成果转化效率不高的根本原因之一。</br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        在理论分析地方综合科研机构与国立科研机构以及研究型高校知识协同创新、与企业技术协同创新的基础上，针对现实中创新链上的断裂带，以地方综合科研机构的视角构建出支持产学研协同创新的以中试熟化为核心的全链条创新服务体系。
        </p>
      </div>
      <div class="col-md-5 col-md-pull-7">
        <img class="featurette-image img-responsive center-block" src="images/iurc2.jpg" alt="Generic placeholder image">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">产学研用一体化<span class="glyphicon glyphicon-grain" aria-hidden="true"></span></h2>
        <br class="lead">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        创新是引领发展的第一动力，推进产学研用一体化是实施创新驱动发展战略的必然要求，是把创新成果转化为现实生产力的必由之路。前不久召开的中央财经委员会第二次会议强调，要推进产学研用一体化，支持龙头企业整合科研院所、高等院校力量，建立创新联合体。加快提升创新能力，促进转型升级，推进产学研用一体化是重要途径和抓手。</br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         一些发达国家根据自己的实际国情、创新资源、制度体系等，在产学研用合作实践中不断探索，形成了各具特色、行之有效的产学研用一体化模式。美国产学研用合作的显著特点是，多元主体参与、合作计划完备、创新应用性较强。英国产学研用合作的显著特点是，强调高校与企业之间的合作，以科研和教育为主。日本产学研用合作的显著特点是，合作制度化、规范化，以促进研究为核心要义。目前，这些国家基本形成了契约合作、技术协作、入股合作等内容丰富、形式多样的产学研用合作模式
        </p>
      </div>
      <div class="col-md-5">
        <img class="featurette-image img-responsive center-block" src="images/iurc3.png" alt="Generic placeholder image">
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




<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>