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

<title>My JSP 'exam.jsp' starting page</title>

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
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>js/jquery.knob.min.js"></script>
<script src="<%=basePath%>js/jquery.ba-throttle-debounce.min.js"></script>
<script src="<%=basePath%>js/jquery.redcountdown.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style>
pre {
	max-width: 100%;
	height: 200px;
	overflow: scroll;
	border: 1px solid #666;
	margin: 0;
}

body {
	font-family: 'Open Sans';
	font-weight: 300;
	padding: 0;
	margin: 0;
}

.redCountdownDemo {
	margin: 0 0 0 0;
	display: block;
}

section>.wrapper {
	max-width: 800px;
	margin: 0 auto;
}

section.header {
	background: #e74c3c;
	color: #FFF;
	margin-bottom: 30px;
}

section.header>.wrapper {
	padding: 30px 0 30px;
}

pre {
	margin-bottom: 30px;
}

pre.small {
	height: 40px;
	overflow-y: hidden;
}

h1 {
	font-size: 42px;
	font-weight: 300;
	margin: 0;
}

h2 {
	font-size: 30px;
	font-weight: 300;
	margin: 0;
}

#rC_D {
	background: #29AAE2;
	border: 0px solid rgba(0, 0, 0, 0);
	width: 400px;
}

b {
	font-weight: 600 !important;
}

.options b {
	display: block;
	border-bottom: 5px solid #666;
	margin-top: 8px;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				//reset();
				/* var url = location.search;
				var theRequest = new Object();
				if (url.indexOf("?") != -1) {
					var str = url.substr(1);
					strs = str.split("&");
					for (var i = 0; i < strs.length; i++) {
						theRequest[strs[i].split("=")[0]] = unescape(strs[i]
								.split("=")[1]);
					}
				}
				var flag = theRequest.flag; */
				//alert("uuu");
				var flag ='<%=request.getAttribute("flag")%>';
				//alert(flag);
				//document.getElementById('flag').value = flag;
				//Next();
				$.ajax({
					type : "POST",
					url : "ExamAction_startExam",
					dataType : "text",
					data : "flag=" + flag,
					beforeSend : function(XMLHttpRequest) {
						//Pause(this,1);
					},
					success : function(msg) {
						document.getElementById('examContent').value = msg;
						//var ob = JSON.parse(msg);
						//var str = "";
						//alert(ob[1].gid);
						//alert($("#examContent").val());
						document.getElementById('flag').value = 0;
						Next();
						//for (var i = 0; i < ob.length; i++) {
						//	document.getElementById("t" + (i + 1)).innerHTML = ob[i].exam
						//			+ "=";

						//str = str + "式子：" + ob[i].exam + "  结果:" + ob[i].trueresult
						//		+ "<br>";

						//alert(ob[i].exam);
						//}

					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});

				//alert($("#examContent").val());
			});
	function Submit() {
		var flag = parseInt(parseInt(document.getElementById('flag').value) + 1);
		if (flag == '5') {

			var ans = "";
			for (var j = 1; j < 6; j++) {

				if (document.getElementById("d" + j).value == "") {
					ans = "-";
				} else {
					ans = document.getElementById("d" + j).value;
				}
				document.getElementById("answers").value = document
						.getElementById("answers").value
						+ "@" + ans;
			}
			document.getElementById('form').submit();
		} else {
			if (window.confirm("您还有试题未做，确定要交卷吗？")) {
				var ans = "";
				for (var j = 1; j < 6; j++) {

					if (document.getElementById("d" + j).value == "") {
						ans = "-";
					} else {
						ans = document.getElementById("d" + j).value;
					}
					document.getElementById("answers").value = document
							.getElementById("answers").value
							+ "@" + document.getElementById("d" + j).value;
				}
				document.getElementById('form').submit();
			}
		}

	}
	function Next() {
		//alert(document.getElementById('flag').value);
		var json = document.getElementById('examContent').value;
		var ob = JSON.parse(json);
		var flag = parseInt(parseInt(document.getElementById('flag').value) + 1);
		if (flag == '5') {

			//alert(document.getElementById("answers").value);
		} else {
			if (flag == '1') {
				document.getElementById('flag').value = flag;
				for (var i = (flag - 1) * 5, j = 0; i < flag * 5; i++, j++) {
					document.getElementById("t" + (j + 1)).innerHTML = ob[i].exam
							+ "=";
				}
			} else {
				if (flag == '4') {
					//alert("dao");
					document.getElementById("imageBt").src = "image/next_no.png";
					document.getElementById("imageBt").onclick = function() {
					}
				}
				var ans = "";
				for (var j = 1; j < 6; j++) {

					if (document.getElementById("d" + j).value == "") {
						ans = "-";
					} else {
						ans = document.getElementById("d" + j).value;
					}
					document.getElementById("answers").value = document
							.getElementById("answers").value
							+ "@" + document.getElementById("d" + j).value;
					document.getElementById("d" + j).value = "";
				}
				document.getElementById('flag').value = flag;
				var ht = "";
				for (var i = (flag - 1) * 5, j = 0; i < flag * 5; i++, j++) {
					document.getElementById("t" + (j + 1)).innerHTML = ob[i].exam
							+ "=";
					//document.getElementById("t" + (j + 1)).innerText="00";
					//document.getElementById("d" + (j + 1)).value=ob[i].trueresult;
					//document.getElementById("answers").value=document.getElementById("answers").value+"@"+document.getElementById("d" + (j + 1)).value;
				}
			}

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
					<li class="c1"><a href="index.html">主页</a></li>
					<li class="c2"><a href="person.html">个人中心</a></li>
					<li class="c3"><a href="GradeRecordAction_getRecord?askPageNum=1">试题查询</a></li>
					<li class="c4"><a href="graderecord.jsp">成绩查询</a></li>
					<li class="c5"><a href="rank.jsp">排行榜</a></li>
					<li class="c6 dropdown active">
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
		<img style="float: left;margin-left: 120px;" alt="" src="image/kaoshi.png">
		<div style="float: left;" id="rC_D" class="redCountdownDemo"></div>
		<!-- 用来接收和存储数据 -->
		<%-- <input type="hidden" id="end" value="<%=session.getAttribute("end") %>">
		<input type="hidden" id="start" value="<%=session.getAttribute("start") %>"> --%>
		<form id="form" action="ExamAction_endExam" method="post">
			<input type="hidden" name="examContent" id="examContent"> <input
				type="hidden" name="answers" id="answers" value="">
		</form>
		<!-- 记录这是第几个五数据 -->
		<input type="hidden" id="flag">

	</div>
	</header>

	<div style="height:50px"></div>

	<div class="row row1">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/1.png)">
			<div class="innerDiv zt" id="t1" style="float: right;margin-top: 20px;">1+1</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/2.png); margin-left:30px">
			<div class="innerDiv zt">
				<input id="d1" type="text"
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;">
			</div>
		</div>

	</div>

	<div class="row row1" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-2 dx1"
			style="background-image: url(image/cube/3.png);">
			<div class="innerDiv zt" id="t2" style="float: right;margin-top: 20px;">2+2+2</div>
		</div>
		<div class="col-md-4 dx2 "
			style="background-image: url(image/cube/4.png); margin-left:30px">
			<div class="innerDiv zt" style="">
				<input id="d2" type="text"
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;">
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
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;">
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
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;">
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
					style="border:0px;background:rgba(0, 0, 0, 0);width: 120px;height: 80px;">
			</div>
		</div>

	</div>


	<div class="row" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-4 text-center">
			<img src="image/next_5.png" class="img-rounded" id="imageBt"
				height="50" style="margin-right:30px " onclick="javascript:Next();" />
			<img src="image/end_exam.png" class="img-rounded" id="imageBc"
				height="50" style="margin-left:30px " onclick="javascript:Submit();" />
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-md-4 col-md-offset-4 text-center">
			<div></div>
		</div>
	</div>
	<div id="envon" style=" width:300px; background-color:#FFFFFF; border:1px solid #000000; padding:20px; overflow:hidden; display:none;">
		<!-- <a href="javascript:EV_closeAlert()">关闭</a> -->
		<p>考试时间已到！自动交卷中……</p>
	</div>
	
	<script type="text/javascript">
		$('#rC_D')
				.redCountdown(
						{
							//end-now就是秒数

							end : '1476528267445',
							now : '1476528266245',
							labels : true,
							labelsOptions : {
								lang : {
									days : 'Days',
									hours : 'H',
									minutes : 'M',
									seconds : 'S'
								},
								//改变字体大小
								style : 'font-size:0.7em; text-transform:uppercase;'
							},
							style : {
								element : "",
								textResponsive : .7,//数字的字体大小
								daysElement : {

									gauge : {
										thickness : .000001,//改变圆圈的粗细
										bgColor : "rgba(255,255,255,0.01)",//浅的时间
										fgColor : "rgba(255,255,255,1)",//深的时间
										lineCap : 'round'
									},
									textCSS : 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.0000001);'
								},
								hoursElement : {
									gauge : {
										thickness : .05,
										bgColor : "rgba(255,255,255,0.1)",
										fgColor : "rgba(255,255,255,1)",
										lineCap : 'round'
									},
									textCSS : 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
								},
								minutesElement : {
									gauge : {
										thickness : .05,
										bgColor : "rgba(255,255,255,0.1)",
										fgColor : "rgba(255,255,255,1)",
										lineCap : 'round'
									},
									textCSS : 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
								},
								secondsElement : {
									gauge : {
										thickness : .05,
										bgColor : "rgba(255,255,255,0.1)",
										fgColor : "rgba(255,255,255,1)",
										lineCap : 'round'
									},
									textCSS : 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
								},

							},
							onEndCallback : function() {
							EV_modeAlert('envon');
								/* setTimeout(function() {
								if (alert("考试时间已到！交卷中……")) {
									document.getElementById('form').submit();
								}
								
								}, 2000); */
							}
						});
						
						//用来记录要显示的DIV的ID值
var EV_MsgBox_ID="envon"; //重要

//弹出对话窗口(msgID-要显示的div的id)
function EV_modeAlert(msgID){
	//创建大大的背景框
	var bgObj=document.createElement("div");
	bgObj.setAttribute('id','EV_bgModeAlertDiv');
	document.body.appendChild(bgObj);
	//背景框满窗口显示
	EV_Show_bgDiv();
	//把要显示的div居中显示
	EV_MsgBox_ID=msgID;
	EV_Show_msgDiv();
	setTimeout(function() {
	EV_closeAlert();
	document.getElementById('form').submit();
								
								}, 2000);
}

//关闭对话窗口
function EV_closeAlert(){
	var msgObj=document.getElementById(EV_MsgBox_ID);
	var bgObj=document.getElementById("EV_bgModeAlertDiv");
	msgObj.style.display="none";
	document.body.removeChild(bgObj);
	EV_MsgBox_ID="";
}

//窗口大小改变时更正显示大小和位置
window.onresize=function(){
	if (EV_MsgBox_ID.length>0){
		EV_Show_bgDiv();
		EV_Show_msgDiv();
	}
}

//窗口滚动条拖动时更正显示大小和位置
window.onscroll=function(){
	if (EV_MsgBox_ID.length>0){
		EV_Show_bgDiv();
		EV_Show_msgDiv();
	}
}

//把要显示的div居中显示
function EV_Show_msgDiv(){
	var msgObj   = document.getElementById(EV_MsgBox_ID);
	msgObj.style.display  = "block";
	var msgWidth = msgObj.scrollWidth;
	var msgHeight= msgObj.scrollHeight;
	var bgTop=EV_myScrollTop();
	var bgLeft=EV_myScrollLeft();
	var bgWidth=EV_myClientWidth();
	var bgHeight=EV_myClientHeight();
	var msgTop=bgTop+Math.round((bgHeight-msgHeight)/2);
	var msgLeft=bgLeft+Math.round((bgWidth-msgWidth)/2);
	msgObj.style.position = "absolute";
	msgObj.style.top      = msgTop+"px";
	msgObj.style.left     = msgLeft+"px";
	msgObj.style.zIndex   = "10001";
	
}
//背景框满窗口显示
function EV_Show_bgDiv(){
	var bgObj=document.getElementById("EV_bgModeAlertDiv");
	var bgWidth=EV_myClientWidth();
	var bgHeight=EV_myClientHeight();
	var bgTop=EV_myScrollTop();
	var bgLeft=EV_myScrollLeft();
	bgObj.style.position   = "absolute";
	bgObj.style.top        = bgTop+"px";
	bgObj.style.left       = bgLeft+"px";
	bgObj.style.width      = bgWidth + "px";
	bgObj.style.height     = bgHeight + "px";
	bgObj.style.zIndex     = "10000";
	bgObj.style.background = "#777";
	bgObj.style.filter     = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=60,finishOpacity=60);";
	bgObj.style.opacity    = "0.6";
}
//网页被卷去的上高度
function EV_myScrollTop(){
	var n=window.pageYOffset 
	|| document.documentElement.scrollTop 
	|| document.body.scrollTop || 0;
	return n;
}
//网页被卷去的左宽度
function EV_myScrollLeft(){
	var n=window.pageXOffset 
	|| document.documentElement.scrollLeft 
	|| document.body.scrollLeft || 0;
	return n;
}
//网页可见区域宽
function EV_myClientWidth(){
	var n=document.documentElement.clientWidth 
	|| document.body.clientWidth || 0;
	return n;
}
//网页可见区域高
function EV_myClientHeight(){
	var n=document.documentElement.clientHeight 
	|| document.body.clientHeight || 0;
	return n;
}
	</script>
</body>
</html>
