<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

<style type="text/css">
<!--
* {
	font-family: simsun;
	margin: 0px;
	padding: 0px;
}

body {
	font-size: 12px;
}

li {
	list-style: none;
	height: 50px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	font-size: 20px;
	color: #3381BF;
}

a:hover {
	text-decoration: underline;
}

#movie_rank {
	height: 260px;
}

.box2 {
	border: 1px solid #ADDFF2;
	overflow: hidden;
	color: #9C9C9C;
}

.box2 {
	margin-bottom: 7px;
}

.box2 h2 {
	background: #EEF7FE;
	height: 70px;
	line-height: 21px;
	overflow-y: hidden;
	border-bottom: 1px solid #ADDFF2;
	color: #1974C8;
	font-size: 12px;
	padding: 0px 8px;
}

.box2 h2 a.more {
	float: right;
	text-decoration: underline;
	background: url() no-repeat 100% -123px;
	padding-right: 8px;
	font-weight: normal;
}

.box2 h2 span {
	margin-left: 20px;
	font-weight: normal;
	color: #B9B7B8;
}

.box2 .inner {
	padding: 8px;
	line-height: 18px;
	overflow: hidden;
	color: #3083C7;
}

.box2 a {
	color: #3083C7;
	white-space: nowrap;
}

.rank_list {
	line-height: 20px;
	margin: center;
	padding-top: 5px;
	align: center;
}

.rank_list li {
	height: 20px;
	margin-bottom: 5px;
	width: 400px;
	padding-left: 20px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.rank_list li.top3 em {
	background: #FFE4B7;
	border: 1px solid #FFBB8B;
	color: #FF6800;
}

.rank_list em {
	position: absolute;
	left: 0;
	top: 0;
	width: 20px;
	height: 20px;
	border: 1px solid #B1E0F4;
	color: #6298CC;
	font-style: normal;
	font-size: 10px;
	font-family: Arial;
	background: #E6F0FD;
	text-align: center;
	line-height: 12px;
	overflow: hidden;
}

/* .rank_list span {
	position: absolute;
	width: 60px;
	color: #B7B7B7;
	text-align: right;
	height: 14px;
	background: #fff;
	left: 300px;
}
 */
.p1 {
	font-size: 20px;
	color: back
}

#movie_rank .rank_list span {
	position: absolute;
	width: 40px;
	color: #B7B7B7;
	text-align: right;
	height: 14px;
	background: #fff;
	left: 260px;
}
-->
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="free-educational-responsive-web-template-webEdu">
<meta name="author" content="webThemez.com">
<title>排行榜</title>
<link rel="favicon" href="assets/images/favicon.png">
<link rel="stylesheet" media="screen"
	href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- Custom styles for our template -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" href="assets/css/style.css">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"> <img
					src="assets/images/logo.png" alt="Techro HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li class="c1"><a href="index.html">主页</a></li>
					<li class="c2"><a href="person.html">个人中心</a></li>
					<li class="c3"><a
						href="GradeRecordAction_getRecord?askPageNum=1">试题查询</a></li>
					<li class="c4"><a href="graderecord.jsp">成绩查询</a></li>
					<li class="c5 active"><a href="rank.jsp">排行榜</a></li>
					<li class="c6 dropdown"><a href="exam.jsp?flag=primary"
						class="dropdown-toggle" data-toggle="dropdown">考试 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="exam.jsp?flag=primary">一级难度</a></li>
							<li><a href="exam.jsp?flag=medium">二级难度</a></li>
							<li><a href="exam.jsp?flag=higher">三级难度</a></li>
						</ul></li>
					<li class="c7"><a href="contact.jsp">联系我们</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>







	<!-- /.navbar -->

	<div id="head" class="secondary" style="height: 100px;">
		<div class="container">
			<h1>排行榜</h1>

		</div>
	</div>



	<header class="hll"
		style="width:100%;height:800px; background:url('img/5.jpg'); background-position:center; background-repeat:no-repeat">
	<div class="inner" style=" margin-left:450px;">
		<ul class="rank_list">

			<s:iterator value="#request.rankList" var="rank" status="st">
				<s:if test="#st.index==0">
					<li class="top3" style="margin-top: 420px;height: 30px;">
					<em><s:property	value="#st.index+1" /></em>
					 <span style="color:#FF44AA; font-size:25px;margin-left:150px;"><s:property value="#rank.name" /></span> <span><s:property
								value="#rank.gscore" /></span></li>
				</s:if>
				<s:if test="#st.index<3">
					<s:if test="#st.index==0">
					</s:if>
					<s:else>
						<li class="top3"><em><s:property value="#st.index+1" /></em>
							<a href="#"><s:property value="#rank.name" /></a> <span><s:property
									value="#rank.gscore" /></span></li>
					</s:else>

				</s:if>
				<s:else>
					<li><em><s:property value="#st.index+1" /></em> <a href="#"><s:property
								value="#rank.name" /></a> <span><s:property
								value="#rank.gscore" /></span></li>
				</s:else>


			</s:iterator>

		</ul>
	</div>




	</header>
	<footer id="footer">

	<div class="container">
		<div class="row">
			<div class="footerbottom">
				<div class="col-md-3 col-sm-6">
					<div class="footerwidget">
						<h4>
							<i class="fa fa-map-marker"></i> 天津大学软件学院
						</h4>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footerwidget">
						<h4>
							<i class="fa fa-phone"></i>+00 000 000 000 <br>
						</h4>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footerwidget">
						<h4>
							<i class="fa fa-envelope-o"></i> 644617176@qq.com
						</h4>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footerwidget">
						<h4>Welcome To Contact</h4>
					</div>
					<!-- end widget -->
				</div>
			</div>
		</div>
	</div>
	</footer>

</body>
</html>
