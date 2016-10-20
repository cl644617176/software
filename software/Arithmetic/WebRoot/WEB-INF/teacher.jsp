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

<title>My JSP 'teacher.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="favicon" href="assets/images/favicon.png">
<link rel="stylesheet" media="screen"
	href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- Custom styles for our template -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="assets/css/isotope.css"
	media="screen" />
<link rel="stylesheet" href="assets/js/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="assets/css/style.css">
<script type="text/javascript" src="<%=basePath%>js/highcharts.js"></script>
<script type="text/javascript" src="<%=basePath%>js/exporting.js"></script>


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
					<li class="c1"><a href="index.html">Home</a></li>
					<li class="c2"><a href="about.html">About</a></li>
					<li class="c3"><a href="courses.html">Courses</a></li>
					<li class="c4"><a href="price.html">Price</a></li>
					<li class="c5 active"><a href="videos.html">Videos</a></li>
					<li class="c6 dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-right.html">Right Sidebar</a></li>
							<li><a href="#">Dummy Link1</a></li>
							<li><a href="#">Dummy Link2</a></li>
							<li><a href="#">Dummy Link3</a></li>
						</ul></li>
					<li class="c7"><a href="contact.html">Contact</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

	<header id="head" class="secondary"
		style="background:url(image/xueshengchengjibiao1.png) ">
	<div class="container"></div>
	</header>


	<!-- container -->
	<section class="container">
	<div class="row">
		<div class="col-md-12">
			<section id="portfolio" class="page-section section appear clearfix">
			<br />
			<br />



			<div class="row">
				<nav id="filter" class="col-md-12 text-center">
				<ul>
					<li><a href="#" class="current btn-theme btn-small"
						data-filter="*">所有同学</a></li>
					<li><a href="#" class="btn-theme btn-small"
						data-filter=".webdesign">优秀</a></li>
					<li><a href="#" class="btn-theme btn-small"
						data-filter=".photography">良好</a></li>
					<li><a href="#" class="btn-theme btn-small"
						data-filter=".print">一般</a></li>
				</ul>
				</nav>
				<div class="col-md-12">
					<div class="row">
						<div class="portfolio-items isotopeWrapper clearfix" id="3">

							<!-- 3个list   优秀listY  良好listL   一般listB -->
							<s:iterator value="#request.listY" var="stu" status="st">
								<article class="col-sm-4 isotopeItem webdesign"
									style="height:220px; width:220px;">
								<div class="portfolio-item" style="text-align: center;">
									<img src='image/touxiang/nan<s:property value='#st.index+1'/>.jpg' alt="" />
									<div class="portfolio-desc align-center">
										<div style="color: #fff;" id='<s:property value='#stu.snumber'/>'
											class="folio-info" onmouseover="XIAN(this);"
											onmouseout="XIAO(this);" onclick="GoGradeRecord(this);">
											<span>点击查看</span>
											<span><s:property value="#stu.sname" /></span>
											<span>的详细成绩</span>
										</div>
									</div>
									<span><s:property value="#stu.sname" />&nbsp;&nbsp;</span>
									<span><s:property value="#stu.snumber" /></span>
								</div>
								</article>
							</s:iterator>
							<s:iterator value="#request.listL" var="stu" status="st">
								<article class="col-sm-4 isotopeItem photography"
									style="height:220px; width:220px;">
								<div class="portfolio-item" style="text-align: center;">
									<img src='image/touxiang/nv<s:property value='#st.index+1'/>.jpg' alt="" />
									
									<div class="portfolio-desc align-center">
										<div style="color: #fff;" id='<s:property value='#stu.snumber'/>'
											class="folio-info" onmouseover="XIAN(this);"
											onmouseout="XIAO(this);" onclick="GoGradeRecord(this);">
											<span>点击查看</span>
											<span><s:property value="#stu.sname" /></span>
											<span>的详细成绩</span>
										</div>
									</div>
									<span><s:property value="#stu.sname" /> &nbsp;&nbsp;</span>
									<span><s:property value="#stu.snumber" /></span>
								</div>
								</article>
							</s:iterator>
							<s:iterator value="#request.listB" var="stu" status="st">
								<article class="col-sm-4 isotopeItem print"
									style="height:220px; width:220px;">
								<div class="portfolio-item" style="text-align: center;">
									<img src='image/touxiang/nan<s:property value='#st.index+3'/>.jpg' alt="" />
									<div class="portfolio-desc align-center">
										<div style="color: #fff;" id='<s:property value='#stu.snumber'/>'
											class="folio-info" onmouseover="XIAN(this);"
											onmouseout="XIAO(this);" onclick="GoGradeRecord(this);">
											<span>点击查看</span>
											<span><s:property value="#stu.sname" /></span>
											<span>的详细成绩</span>
										</div>
									</div>
									<span><s:property value="#stu.sname" />&nbsp;&nbsp;</span>
									<span><s:property value="#stu.snumber" /></span>
								</div>
								</article>
							</s:iterator>




						</div>

					</div>


				</div>
			</div>

			</section>
		</div>
	</div>

	</section>
	<script type="text/javascript">
		function GoGradeRecord(ob){
			window.location.href='GradeRecordAction_getRecord?askPageNum=1&snu_tea='+ob.id;
		}
		function XIAO(a) {
			var my = document.getElementById(a.id + 'd');
			if (my != null)
				my.parentNode.removeChild(my);
		}
		function getRect(elements) {
			var rect = elements.getBoundingClientRect();
			var clientTop = document.documentElement.clientTop;
			var clientLeft = document.documentElement.clientLeft;
			return { // 兼容ie多出的两个px 
				top : rect.top - clientTop, // 距离顶部的位置 
				bottom : rect.bottom - clientTop, // 距离顶部加上元素本身的高度就等于bottom的位置 
				left : rect.left - clientLeft, // 距离左边的位置 
				right : rect.right - clientLeft // 距离右边的位置就是 距离左边的位置加上元素本身的宽度 
			};
		};

		function XIAN(object) {
			//alert("xian");
			var chart;
			//alert(ev.children[0].value);//获取div子控件的值
			//alert(ev.children[1].innerHTML);
			var oDiv = document.createElement('div');
			oDiv.id = object.id + 'd';
			//var X = object.getBoundingClientRect().left + object.clientWidth;
			//var Y = object.getBoundingClientRect().top + object.clientHeight;
			//判断生成在上面还是下面
			//alert(object.getBoundingClientRect().top);
			//alert(object.getBoundingClientRect().bottom);
			//alert(object.getBoundingClientRect().left);
			//alert(object.getBoundingClientRect().right);
			var X;
			var Y;
			var left = $('#' + object.id).offset().left;
			var top = $('#' + object.id).offset().top+100;
			//alert(top);
			//alert(left);
			
	if (top > 300) {
				Y = top - 300;
			} else {
				Y = top+object.clientHeight;
			}
			//判断是左面还是右面
			//alert(geRect(object).bottom);
			//alert(getRect(object).right);

			//alert(bottom);
			
			if (left > 600) {
				X = left - 600;
			} else {
				X = left + object.clientWidth;
			}

			oDiv.style.left = X + 'px';
			oDiv.style.top = Y + 'px';
			oDiv.style.border = '0px solid #FF0000'; // 设置边框
			oDiv.style.position = 'absolute'; // 为新创建的DIV指定绝对定位
			oDiv.style.background = '#fff';//设置背景颜色
			oDiv.style.opacity = '1.0';//设置背景透明度
			oDiv.style.width = '600px'; // 指定宽度
			oDiv.style.height = '300px'; // 指定高度
			oDiv.style.zIndex = 600;
			document.body.appendChild(oDiv);

			$.ajax({
				type : "POST",
				url : "GradeRecordAction_getScore",
				dataType : "text",
				data : "snu_tea=" + object.id,
				beforeSend : function(XMLHttpRequest) {
					//Pause(this,1);
				},
				success : function(msg) {
					//document.getElementById('examContent').value = msg;
					//ob是一个list的数组
					var ob = JSON.parse(msg);
					//alert(ob);
					//var listm = ob[0][0].gid;
					//alert(ob[0].length);
					//alert(ob[1].length);
					//alert(ob[2].length);
					var dataPrimary = new Array();
					var dataMedium = new Array();
					var dataHigher = new Array();

					for (var p = 0; p < ob[0].length; p++) {
						dataPrimary[p] = parseInt(ob[0][p].gscore);
					}
					for (var m = 0; m < ob[1].length; m++) {
						dataMedium[m] = parseInt(ob[1][m].gscore);
					}
					for (var h = 0; h < ob[2].length; h++) {
						dataHigher[h] = parseInt(ob[2][h].gscore);
					}

					chart = new Highcharts.Chart({
						chart : {
							//renderTo : 'container',
							renderTo : object.id + 'd',
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
							categories : [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
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
								return '<b>' + this.series.name + '</b><br/>'
										+ this.x + ': ' + this.y + '分';
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
									data : dataMedium
								},
								{
									name : '高级',
									data : dataHigher
								},
								{
									name : '及格线',
									data : [ 60, , 60, 60, , 60, 60, 60, 60,
											60, 60, 60 ]

								},

						]
					});

				},
				complete : function(XMLHttpRequest, textStatus) {

				},
				error : function() {

				}
			});

		}
	</script>
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cslider.js"></script>
	<script src="assets/js/jquery.isotope.min.js"></script>
	<script src="assets/js/fancybox/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script src="assets/js/custom.js"></script>

	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>


</body>
</html>
