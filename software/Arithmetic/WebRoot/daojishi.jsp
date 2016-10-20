<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daojishi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>js/jquery.knob.min.js"></script>
<script src="<%=basePath%>js/jquery.ba-throttle-debounce.min.js"></script>
<script src="<%=basePath%>js/jquery.redcountdown.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style>
pre { max-width:100%; height:200px; overflow:scroll; border:1px solid #666; margin:0; }
body { font-family:'Open Sans'; font-weight:300; padding:0; margin:0;}
.redCountdownDemo { margin:0 0 0 0;  display:block; }
section > .wrapper { max-width:800px; margin:0 auto; }
section.header { background:#e74c3c; color:#FFF; margin-bottom:30px; }
section.header > .wrapper {  padding:30px 0 30px; }
pre { margin-bottom:30px; }
pre.small { height:40px; overflow-y:hidden; }
h1 { font-size:42px;  font-weight:300; margin:0; }
h2 { font-size:30px;  font-weight:300; margin:0; }

#rC_D { background:#29AAE2; border:1px solid rgba(0,0,0,0); width: 400px;}
b { font-weight:600!important; }
.options b { display:block; border-bottom:5px solid #666; margin-top:8px; }
</style>

  </head>
  
  <body>
<div id="rC_D" class="redCountdownDemo"></div>
<input id="end" value="1388471330">
<script type="text/javascript">
	
		
	$('#rC_D').redCountdown({
	//end-now就是秒数
	
		end: $("#end").val(),
		now: '1388471324',
		labels: true,
		labelsOptions: {
			lang: {
				days: 'Days',
				hours: 'H',
				minutes: 'M',
				seconds: 'S'
			},
			//改变字体大小
			style: 'font-size:0.7em; text-transform:uppercase;'
		},
		style: {
			element: "",
			textResponsive: .7,//数字的字体大小
			daysElement: {
				
				gauge: {
					thickness: .000001,//改变圆圈的粗细
					bgColor: "rgba(255,255,255,0.01)",//浅的时间
					fgColor: "rgba(255,255,255,1)",//深的时间
					lineCap: 'round'
				},
				textCSS: 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.0000001);'
			},
			hoursElement: {
				gauge: {
					thickness: .05,
					bgColor: "rgba(255,255,255,0.1)",
					fgColor: "rgba(255,255,255,1)",
					lineCap: 'round'
				},
				textCSS: 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
			},
			minutesElement: {
				gauge: {
					thickness: .05,
					bgColor: "rgba(255,255,255,0.1)",
					fgColor: "rgba(255,255,255,1)",
					lineCap: 'round'
				},
				textCSS: 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
			},
			secondsElement: {
				gauge: {
					thickness: .05,
					bgColor: "rgba(255,255,255,0.1)",
					fgColor: "rgba(255,255,255,1)",
					lineCap: 'round'
				},
				textCSS: 'font-family:\'Open Sans\'; font-size:25px; font-weight:300; color:rgba(255,255,255,0.7);'
			},
			
		},
		onEndCallback: function() { alert("daole"); }
	});
	
	
</script>
</div></section>
  </body>
</html>
