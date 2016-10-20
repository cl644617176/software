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
<title>登录</title>
<meta name="keywords" content="登录" />
<meta name="description" content="dl" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="<%=basePath%>css/reset.css">
<link rel="stylesheet" href="<%=basePath%>css/supersized.css">
<link rel="stylesheet" href="<%=basePath%>css/style.css">

<script type="text/javascript">
function JudgeAll(){
	var flag=0;
	if(JudgeSNumber()==false){
		flag=1;
	}
	
	
		if($("#spassword").val()==""){
			flag=1;
			 $("#error_spassword").show();
			 $("#spassword").focus();
		}
		if(flag==1){
			return false;
		}else{
		document.getElementById('form').submit();
		return true;
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
		}
		$("#error_snumber").hide();
		return true;
	}
</script>

</head>

<body>

	<div class="login-page-container">
		<label
			style="background-position: center;width: 300px;text-align: center;"><h1>登录</h1></label>
		<form id="form" action="UserAction_login" method="post">
			<div id="error_snumber" class="error" style="top: 27px;">
				<span>+</span>
			</div>
			<div id="error_spassword" class="error" style="top: 96px;">
				<span>+</span>
			</div>
		
			<input id="snumber" type="text" name="loginNumber" class="username" placeholder="学号">
			<input id="spassword" type="password"  name="loginPassword" class="password"
				placeholder="密码">
				
			<div style="margin-left:50px;display: inline;" >
				<input type="radio" name="role" class="role1" id="radio1" style="width: 50;height: 50;margin-top:20px;"
					value="teacher" /><span style="margin-left: 8px">教师</span>
					

			</div>
			<div style="margin-left:90px;display: inline;">
				<input type="radio" name="role" class="role" id="radio2"
					value="student" checked="checked" /> <span style="margin-left: 8px">学生</span>
			</div>
			
	<button type="button" style="margin-left: 2px" onclick="javascropt:return JudgeAll();">登录
	</button>
			
		</form>
		<div style="width: 100%;text-align: center;float: left;">
		<a href="register.jsp"><button type="submit" style="background-position: center;">去注册</button></a>
		</div>
		<div class="connect"></div>
	</div>

	<!-- Javascript -->
	<script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script src="<%=basePath%>js/supersized.3.2.7.min.js"></script>
	<script src="<%=basePath%>js/supersized-init.js"></script>
	<script src="<%=basePath%>js/scripts.js"></script>

</body>

</html>


