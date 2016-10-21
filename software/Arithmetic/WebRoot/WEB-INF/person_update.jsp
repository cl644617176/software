<%@page import="ljf.pojo.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'person_update.jsp' starting page</title>
    
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
<link rel="stylesheet" href="assets/css/style.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function Update(){
		$.ajax({
					type : "POST",
					url : "UserAction_personUpdate",
					dataType : "text",
					//data : "s_number=" + $('s_number').val()+"&new_pas=" + $('new_pas').val()+"&old_pas=" + $('old_pas').val(),
					data:{s_number:$('#s_number').val(),new_pas:$('#new_pas').val(),old_pas:$('#old_pas').val()},
					beforeSend : function(XMLHttpRequest) {
						//Pause(this,1);
					},
					success : function(msg) {
						
					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});
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
					<li class="c2 active"><a href="person.html">个人中心</a></li>
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



	<div class="container-fluid">
		<div class="container" style="height: 450px;">
			<div class="col-md-4" style="float: left; width: 200px;">
				<ul class="nav nav-list">
					<li class="nav-header">
						<h3>个人中心</h3>
					</li>
					<li><a href="UserAction_personToUpdate">信息修改</a></li>
					<li><a href="#">信息统计</a></li>
					<li><a href="#">私人定制</a></li>
					<li class="divider"></li>
					<li><a href="#">帮助</a></li>
				</ul>
			</div>
			<div class="col-md-8" style="float: left;">
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<h3 class="text-center">个人信息修改</h3>
								<div class="control-group">
									<label class="control-label" for="inputEmail">学号:</label>
									<div class="controls">
										<input id="s_number" type="text" name="s_number" value="${requestScope.student.snumber }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputEmail">老师:</label>
									<div class="controls">
										<input id="inputEmail" type="text" value="${requestScope.tname }"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputEmail">姓名:</label>
									<div class="controls">
										<input id="inputEmail" type="text" value="${requestScope.student.sname }"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputPassword">原密码:</label>
									<div class="controls">
										<input id="old_pas" type="password" name="old_pas" />
									</div>
									<div class="controls"></div>
									<div class="control-group">
										<label class="control-label" for="inputPassword">新密码:</label>
										<div class="controls">
											<input id="new_pas" type="password"   name="new_pas" />
										</div>
										<div class="controls"></div>
										<div class="control-group">
											<label class="control-label" for="inputPassword">请再此输入新密码:</label>
											<div class="controls">
												<input id="new_pas_re" type="password"  name="new_pas_re" />
											</div>
											<div class="controls"></div>
										</div>
										<div class="control-group" style="margin-top: 20px;">
											<div class="controls">
												<button class="btn" type="submit" onclick="Update();">确认修改</button>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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



	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
