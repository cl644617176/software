<%@page import="ljf.pojo.Grade"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'graderecod.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" href="assets/css/style_jh.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
	   <script type="text/javascript" src="<%=basePath%>js/highcharts.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/exporting.js"></script>
        
        
	<script type="text/javascript">
		var chart;
		$(document).ready(
				function() {
					$.ajax({
						type : "POST",
						url : "GradeRecordAction_getScore",
						dataType : "text",
						//data : "flag=" + flag,
						beforeSend : function(XMLHttpRequest) {
							//Pause(this,1);
						},
						success : function(msg) {
							//document.getElementById('examContent').value = msg;
							//ob是一个list的数组
							var ob = JSON.parse(msg);
							//alert(ob);
							var listm = ob[0][0].gid;
							//alert(ob[0].length);
							//alert(ob[1].length);
							//alert(ob[2].length);
							var dataPrimary=new Array();
							var dataMedium =new Array();
							var dataHigher =new Array();
							for(var p=0;p<ob[0].length;p++){
								dataPrimary[p]=parseInt(ob[0][p].gscore);
							}
							for(var m=0;m<ob[1].length;m++){
								dataMedium[m]=parseInt(ob[1][m].gscore);
							}
							for(var h=0;h<ob[2].length;h++){
								dataHigher[h]=parseInt(ob[2][h].gscore);
							}

							chart = new Highcharts.Chart({
								chart : {
									renderTo : 'container',
									defaultSeriesType : 'line',
									marginRight : 130,
									marginBottom : 25
								},
								title : {
									text : '近期成绩',
									x : -20
								//center
								},
								subtitle : {
									text : '按等级显示',
									x : -20
								},
								xAxis : {
									categories : [ 1,2,3,4,5,6,7,8,9,10 ]
								},
								yAxis : {
									title : {
										text : '分数'
									},
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ]
								},
								tooltip : {
									formatter : function() {
										return '<b>' + this.series.name
												+ '</b><br/>' + this.x + ': '
												+ this.y + '分';
									}
								},
								legend : {
									layout : 'vertical',
									align : 'right',
									verticalAlign : 'top',
									x : -10,
									y : 100,
									borderWidth : 0
								},
								series : [
										{
											name : '初级',

											data : dataPrimary
										},
										{
											name : '中级',
											data :dataMedium
										},
										{
											name : '高级',
											data : dataHigher
										},
										{
											name : '及格线',
											data : [60,,60,60,,60,60,60,60,60,60,60]
											
										},
										
										]
							});

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
				});
	</script>
	
  </head>
  
  <body>
    <!-- Fixed navbar -->
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="index.html">
					<img src="assets/images/logo.png" alt="Techro HTML5 template"></a>
			</div>
		<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li class="c1"><a href="index.html">主页</a></li>
					<li class="c2"><a href="person.html">个人中心</a></li>
					<li class="c3  active"><a href="GradeRecordAction_getRecord?askPageNum=1">试题查询</a></li>
					<li class="c4"><a href="graderecord.jsp">成绩查询</a></li>
					<li class="c5"><a href="rank.jsp">排行榜</a></li>
					<li class="c6 dropdown">
						<a href="exam.jsp?flag=primary" class="dropdown-toggle" data-toggle="dropdown">考试 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="exam.jsp?flag=primary">一级难度</a></li>
							<li><a href="exam.jsp?flag=medium">二级难度</a></li>
							<li><a href="exam.jsp?flag=higher">三级难度</a></li>
						</ul>
					</li>
					<li class="c7"><a href="contact.jsp">联系我们</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

		<header id="head" class="secondary" style="background:url(image/grade.png) no-repeat; background-size:cover">
            <div class="container">
                       
                </div>
   	    </header>
   	     <div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>
   	    
         <footer id="footer">
 
<div class="container" >
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
                </div><!-- end widget --> 
    </div>
  </div>
</div>
</div>
	</footer>
 	
  </body>
</html>
