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

<title>My JSP 'text_exam_ajax.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="<%=basePath%>js/highcharts.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/exporting.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
window.onload=function(){
    document.onmousedown=function(ev){
        var oEvent=ev||event;
        var oDiv=document.createElement('div');
        oDiv.style.left=oEvent.clientX+'px';  // 指定创建的DIV在文档中距离左侧的位置
        oDiv.style.top=oEvent.clientY+'px';  // 指定创建的DIV在文档中距离顶部的位置
        oDiv.style.border='1px solid #FF0000'; // 设置边框
        oDiv.style.position='absolute'; // 为新创建的DIV指定绝对定位
        oDiv.style.width='200px'; // 指定宽度
        oDiv.style.height='200px'; // 指定高度
        document.body.appendChild(oDiv); 
    }
   /*  document.onmouseover=function(ev){
    	var e=ev.target;
    	alert(e.id);
    } */
}
</script>
<script type="text/javascript">
	
	$(document).ready(
			function() {
				$.getJSON("UserAction_userRegister", function(data) {
					$.each(data, function(i, item) {
						//alert("1234");
						$(
								//value是选中以后的东西   tname是显示的
								"<option value='"+item.tnumber+"'>"
										+ item.tname + "</option>").appendTo(
								"#selectTeacher");
					});
				});
			});
	function submitForm() {
		alert(document.getElementById("selectTeacher").value);
	}
	function Next() {
		$("#duicuo").show();
		if (document.getElementById('trueResult').value == document
				.getElementById('result').value) {
			document.getElementById('duicuo').value = "对";

		} else {
			document.getElementById('duicuo').value = "错  正确答案是："
					+ document.getElementById('trueResult').value;
		}
		setTimeout(
				function() {
					$
							.ajax({
								type : "GET",
								url : "ExamAction_practiceExam",
								dataType : "text",
								//data : "userNameJudge=" + $("#username").val(),
								beforeSend : function(XMLHttpRequest) {
									document.getElementById('result').value = "";
									$("#duicuo").hide();
									//Pause(this,1);
								},
								success : function(msg) {
									var ob = JSON.parse(msg);
									document.getElementById('exam').value = ob.exam;
									document.getElementById('trueResult').value = ob.trueresult;
									/* if(msg==2){
										document.getElementById('username').style.borderColor = 'green'; 
									}else if(msg==1){
										$("#username").focus();
										document.getElementById('username').style.borderColor = 'red'; 
										
									} */
								},
								complete : function(XMLHttpRequest, textStatus) {
									//alert(textStatus);
									//隐藏正在查询图片
								},
								error : function() {
									//错误处理
								}
							});

				}, 1000);

	}

	function ListJson() {
		$.ajax({
			type : "GET",
			url : "ExamAction_ListJson",
			dataType : "text",
			//data : "userNameJudge=" + $("#username").val(),
			beforeSend : function(XMLHttpRequest) {
				//Pause(this,1);
			},
			success : function(msg) {
				var ob = JSON.parse(msg);
				var str = "";
				for (var i = 0; i < ob.length; i++) {
					str = str + "式子：" + ob[i].exam + "  结果:" + ob[i].trueresult
							+ "<br>";

					//alert(ob[i].exam);
				}
				document.getElementById("listJson").innerHTML = str;

			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {

			}
		});
	}
	
	function XIAN(ev){
	var chart;
		//alert(ev.children[0].value);//获取div子控件的值
		//alert(ev.children[1].innerHTML);
		 var oDiv=document.createElement('div');
		 oDiv.id=ev.id+'d';
        var X=ev.getBoundingClientRect().left+ev.clientWidth/2;
        var Y=ev.getBoundingClientRect().top+ev.clientHeight/2;
        oDiv.style.left=X+'px';
        oDiv.style.top=Y+'px';
        oDiv.style.border='0px solid #FF0000'; // 设置边框
        oDiv.style.position='absolute'; // 为新创建的DIV指定绝对定位
        oDiv.style.background='#fff';//设置背景颜色
        oDiv.style.opacity='1.0';//设置背景透明度
        oDiv.style.width='600px'; // 指定宽度
        oDiv.style.height='300px'; // 指定高度
        document.body.appendChild(oDiv); 
        
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
									//renderTo : 'container',
									renderTo:ev.id+'d',
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
        
        
	}
	
	function XIAO(a){
		 var my = document.getElementById(a.id+'d');
		  if (my != null)
		          my.parentNode.removeChild(my);
	}
</script>
</head>

<body>
<img style="width: 400px;height: 300px;" src="image/answer.png" name="t1" id="t1">
<input type="text" name="t2" id="t2">
	<input type="text" name="exam" id="exam">
	<input type="text" name="result" id="result">
	<input type="hidden" id="trueResult">
	<input type="button" id="duicuo">
	<input type="button" onclick="javascript:Next()" value="下一题">
	<input type="button" onclick="javascript:ListJson()" value="测试List数据">
	<p id="listJson"></p>
	<form action="#">
		<select id="selectTeacher" name="selectTeacher">
			<!--  <option value="0">--选择老师--</option>-->
		</select> <input onclick="javascript:submitForm()" value="提交">
	</form>
	<div id="t1" style="width: 400px;height: 300px;background: #000;opacity:1.0;"  onmouseover="XIAN(this);" onmouseout="XIAO(this);">
		<input id="snu" value="2016218001">
		<span>2016218003</span>
	</div>
	<div style="width: 400px;height: 300px;background: #000;opacity:1.0;"  onmouseover="XIAN(this);" onmouseout="XIAO(this);">
		<input id="snu" value="2016218002">
	</div>
</body>
</html>
