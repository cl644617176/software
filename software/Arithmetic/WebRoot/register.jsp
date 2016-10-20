<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>注册</title>
<meta name="keywords" content="四则运算" />
<meta name="description" content="四则运算" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="<%=basePath%>css/reset.css">
<link rel="stylesheet" href="<%=basePath%>css/supersized.css">
<link rel="stylesheet" href="<%=basePath%>css/style.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>


<script type="text/javascript">
$(document).ready(
			function() {
				$.getJSON("UserAction_getTeachers", function(data) {
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
        
		function JudgeAll() {
		var flag=0;
		if(JudgeSNumber()==false){
			flag=1;
			 $("#error_snumber").show();
			$("#snumber").focus();
			//document.getElementById('snumber').style.borderColor = 'red'; 
		}else{
		 $("#error_snumber").hide();
		}
		if($("#sname").val()==""){
			flag=1;
			 $("#error_sname").show();
			$("#sname").focus();
			//document.getElementById('snumber').style.borderColor = 'red'; 
		}else{
			$("#error_sname").hide();
		}
		
		if($("#spassword").val()==""){
			flag=1;
			 $("#error_spassword").show();
			 $("#spassword").focus();
		}
		
		if($("#spassword_confirm").val()!=$("#spassword").val()){
			flag=1;
			 $("#error_spassword").show();
			$("#spassword").focus();
			 $("#error_spassword_confirm").show();
		}else{
			$("#error_spassword").hide();
			 $("#error_spassword_confirm").hide();
		}
		if(flag==0){
			document.getElementById('form1').submit();
			return true;
		}else{
			return false;
		}
	}
	
	function JudgeSNumber(){
		var checkNum =/^[0-9]*[1-9][0-9]*$/;
		if($("#snumber").val()==""){
			 $("#error_snumber").show();
			$("#snumber").focus();
			return false;
		}else if(!(checkNum.test($("#snumber").val()))){
			
			 $("#error_snumber").show();
			$("#snumber").focus();
			
			return false;
		}else{
			$.ajax({
				type : "POST",
				url : "UserAction_judgeSNumber",
				dataType : "text",
				data : "SNumberJudge=" + $("#snumber").val(),
				beforeSend : function(XMLHttpRequest) {
					//Pause(this,10);
				},
				success : function(msg) {
					if(msg==1){
					 //$("#error_snumber").show();
			$("#snumber").focus();
							document.getElementById('snumber').style.borderColor = 'red'; 
						return false;
					}else if(msg==0){
					document.getElementById('snumber').style.borderColor = 'rgba(255,255,255,.15)'; 
					
						return true;
					}
				},
				complete : function(XMLHttpRequest, textStatus) {

					//隐藏正在查询图片
				},
				error : function() {
					//错误处理
				}
			});
		
		}
		$("#error_snumber").hide();
		return true;
	}
	
        </script>

</head>

<body>

	<div id="bo" class="page-container">
		<label
			style="background-position: center;width: 300px;text-align: center;"><h1>注册新用户</h1></label>
			
			
		<form id="form1" action="UserAction_register" method="post">
			<input id="snumber" type="text" name="snumber" class="username"
				placeholder="学号" onblur="JudgeSNumber();"> 
			<div id="error_snumber" class="error" style="top: 27px;">
				<span>+</span>
			</div>
			<div id="error_sname" class="error" style="top: 96px;">
				<span>+</span>
			</div>
			<div id="error_spassword" class="error" style="top: 165px;">
				<span>+</span>
			</div>
			<div id="error_spassword_confirm" class="error" style="top: 234px;">
				<span>+</span>
			</div>
			
				
				<input id="sname" type="text" name="sname"
				class="username" placeholder="姓名"> <input id="spassword"
				type="password" name="spassword" class="password" placeholder="密码">
			<input id="spassword_confirm" type="password" name="password"
				class="password" placeholder="确认密码">
			<div style="margin-top: 20px;text-align: center;">
				请选择你的老师： <select class="select" id="selectTeacher" name="tnumber">
					<!-- <option value="0">--选择老师--</option> -->
				</select>
			</div>
			<button type="button" onclick="javascropt:return JudgeAll();">提交注册</button>
			
		</form>
		<div style="width: 100%;text-align: center;float: left;">
			<a href="login.jsp"><button type="button"
					style="background-position: center;">直接登录</button></a>
		</div>
		
		
		
		
			
	</div>

	<!-- Javascript -->
	<script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script src="<%=basePath%>js/supersized.3.2.7.min.js"></script>
	<script src="<%=basePath%>js/supersized-init.js"></script>
	<script src="<%=basePath%>js/scripts.js"></script>

</body>

</html>


