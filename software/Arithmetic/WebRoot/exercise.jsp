<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'exercise.jsp' starting page</title>

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
<link rel="stylesheet" href="assets/css/style_jh.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(document).ready(
			function() {
				reset();
				var url = location.search;
				var theRequest = new Object();
				if (url.indexOf("?") != -1) {
					var str = url.substr(1);
					strs = str.split("&");
					for (var i = 0; i < strs.length; i++) {
						theRequest[strs[i].split("=")[0]] = unescape(strs[i]
								.split("=")[1]);
					}
				}
				var type = theRequest.type;
				document.getElementById('practiceType').value = type;
				Next();
			});
			
	//获取下一组题并显示
	function Next() {
		reset();
		$
				.ajax({
					type : "POST",
					url : "ExamAction_practiceExam",
					dataType : "text",
					data : "practiceType=" + $("#practiceType").val(),
					beforeSend : function(XMLHttpRequest) {
						//Pause(this,1);
					},
					success : function(msg) {
						document.getElementById('practiceContent').value = msg;
						var ob = JSON.parse(msg);
						var str = "";
						for (var i = 0; i < ob.length; i++) {
							document.getElementById("t" + (i + 1)).innerHTML = ob[i].exam
									+ "=";

							//str = str + "式子：" + ob[i].exam + "  结果:" + ob[i].trueresult
							//		+ "<br>";

							//alert(ob[i].exam);
						}

					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});
	}
	//充值输入框和对错div的状态
	function reset(){
		for(var i=1;i<6;i++){
			document.getElementById("d" + i).value="";
			$("#co"+i).hide();
			$("#fa"+i).hide();
			//document.getElementById("co" + i).style.display=none;
			//document.getElementById("fa" + i).style.display=none;
		}
	}

	function Judge1() {
		var json = document.getElementById('practiceContent').value;
		var ob = JSON.parse(json);
		if ($("#d1").val() != "")
			if ($("#d1").val() == ob[0].trueresult) {
				$("#co1").show();
				$("#fa1").hide();
			} else {
				$("#co1").hide();
				$("#fa1").show();
				//$("#z1").val()=ob[0].trueresult;
				document.getElementById('z1').value = ob[0].trueresult;
			}
	}
	function Judge2() {
		var json = document.getElementById('practiceContent').value;
		var ob = JSON.parse(json);
		if ($("#d2").val() != "")
		if ($("#d2").val() == ob[1].trueresult) {
			$("#co2").show();
			$("#fa2").hide();
		} else {
			$("#co2").hide();
			$("#fa2").show();
			//$("#z1").val()=ob[0].trueresult;
			document.getElementById('z2').value = ob[1].trueresult;
		}
	}
	function Judge3() {
		var json = document.getElementById('practiceContent').value;
		var ob = JSON.parse(json);
		if ($("#d3").val() != "")
		if ($("#d3").val() == ob[2].trueresult) {
			$("#co3").show();
			$("#fa3").hide();
		} else {
			$("#co3").hide();
			$("#fa3").show();
			//$("#z1").val()=ob[0].trueresult;
			document.getElementById('z3').value = ob[2].trueresult;
		}
	}
	function Judge4() {
		var json = document.getElementById('practiceContent').value;
		var ob = JSON.parse(json);
		if ($("#d4").val() != "")
		if ($("#d4").val() == ob[3].trueresult) {
			$("#co4").show();
			$("#fa4").hide();
		} else {
			$("#co4").hide();
			$("#fa4").show();
			//$("#z1").val()=ob[0].trueresult;
			document.getElementById('z4').value = ob[3].trueresult;
		}
	}
	function Judge5() {
		var json = document.getElementById('practiceContent').value;
		var ob = JSON.parse(json);
		if ($("#d5").val() != "")
		if ($("#d5").val() == ob[4].trueresult) {
			$("#co5").show();
			$("#fa5").hide();
		} else {
			$("#co5").hide();
			$("#fa5").show();
			//$("#z1").val()=ob[0].trueresult;
			document.getElementById('z5').value = ob[4].trueresult;
		}
	}
</script>
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
					<li class="c1 active"><a href="index.html">主页</a></li>
					<li class="c2"><a href="person.html">个人中心</a></li>
					<li class="c3"><a href="GradeRecordAction_getRecord?askPageNum=1">试题查询</a></li>
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

	<header id="head" class="secondary">
	<div class="container">
		<h1>做 题 吧</h1>

	</div>
	</header>

	<div style="height:50px"></div>

	<div class="row row1">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/1.png);">
			<div class="innerDiv zt" id="t1" style="float: right;margin-top: 20px;"></div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/2.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d1" type="text"
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;"
					onblur="javascript:Judge1();">
			</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/enpty.png); margin-left:30px;margin-top: 20px;">
			<div id="co1" style="display: none;">
				<img alt="" src="image/correct.png"
					style="width: 40px;height: 40px;">
			</div>
			<div id="fa1" style="display: none;width: 110px;">
				<img alt="" src="image/false.png" style="width: 40px;height: 40px;"><input
					id="z1" style="border:0px;background:rgba(0, 0, 0, 0);width: 60px;font-size: 20px;margin-left: 10px;" />
			</div>
		</div>
	</div>

	<div class="row row1" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/3.png)">
			<div class="innerDiv zt" id="t2" style="float: right;margin-top: 20px;">2+2+2</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/4.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d2" type="text"
				style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;"
					onblur="javascript:Judge2();">
			</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/enpty.png); margin-left:30px;margin-top: 20px;">
			<div id="co2" style="display: none;">
				<img alt="" src="image/correct.png"
					style="width: 40px;height: 40px;">
			</div>
			<div id="fa2" style="display: none;width: 110px;">
				<img alt="" src="image/false.png" style="width: 40px;height: 40px;"><input
					id="z2" style="border:0px;background:rgba(0, 0, 0, 0);width: 60px;font-size: 20px;margin-left: 10px;" />
			</div>
		</div>
	</div>


	<div class="row row1" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/5.png)">
			<div class="innerDiv zt" id="t3" style="float: right;margin-top: 20px;">3+3+3+3</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/6.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d3" type="text"
				style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;"
					onblur="javascript:Judge3();">
			</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/enpty.png); margin-left:30px;margin-top: 20px;">
			<div id="co3" style="display: none;">
				<img alt="" src="image/correct.png"
					style="width: 40px;height: 40px;">
			</div>
			<div id="fa3" style="display: none;width: 110px;">
				<img alt="" src="image/false.png" style="width: 40px;height: 40px;"><input
					id="z3" style="border:0px;background:rgba(0, 0, 0, 0);width: 60px;font-size: 20px;margin-left: 10px;" />
			</div>
		</div>
	</div>

	<div class="row row1" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/7.png)">
			<div class="innerDiv zt" id="t4" style="float: right;margin-top: 20px;">4+4+4+4+4</div>
		</div>
		<div class="col-md-4 dx2"
			style="background-image: url(image/cube/8.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d4" type="text"
				style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;"
					onblur="javascript:Judge4();">
			</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/enpty.png); margin-left:30px;margin-top: 20px;">
			<div id="co4" style="display: none;">
				<img alt="" src="image/correct.png"
					style="width: 40px;height: 40px;">
			</div>
			<div id="fa4" style="display: none;display: inline;width: 110px;">
				<img alt="" src="image/false.png" style="width: 40px;height: 40px;" >
				<input
					id="z4" style="border:0px;background:rgba(0, 0, 0, 0);width:60px;font-size: 20px;margin-left: 10px;" />
			</div>
		</div>
	</div>

	<div class="row row1" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/9.png)">
			<div class="innerDiv zt" id="t5" style="float: right;margin-top: 20px;">5+5+5+5+5+5</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/10.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d5" type="text"
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;"
					onblur="javascript:Judge5();">
			</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/enpty.png); margin-left:30px;margin-top: 20px;">
			<div id="co5" style="display: none;">
				<img alt="" src="image/correct.png"
					style="width: 40px;height: 40px;">
			</div>
			<div id="fa5" style="display: none;width: 110px;">
				<img alt="" src="image/false.png" style="width: 40px;height: 40px;"><input
					id="z5" style="border:0px;background:rgba(0, 0, 0, 0);width: 60px;font-size: 20px;margin-left: 10px;" />
			</div>
		</div>
	</div>


	<div class="row" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-4 text-center">
			<input id="practiceType" type="hidden" width="2px" value="add">
			<input id="practiceContent" type="hidden"> <img
				src="image/cube/change.png" class="img-rounded" id="imageBt"
				height="50" style="margin-right:30px " onclick="javascript:Next()" />
			<img src="image/back.jpg" class="img-rounded" id="imageBc"
				height="50" style="margin-left:30px " />
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-4 text-center">
			<div>
			</div></div></div>
</body>
</html>
