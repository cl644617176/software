<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gradedetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.useso.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" href="assets/css/style_jh.css">
	<script type="text/javascript">
		function Dow(){
			document.getElementById('form').submit();
		}
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

		<header id="head" class="secondary" style="background:url(image/answer.png) no-repeat; background-size:cover" >
            <div class="container">  
                </div>
    </header>
    <div style="background:url(image/bg11.jpg); background-repeat:no-repeat; background-size:cover;">
    <div style="height:40px"></div>

<!-- 显示此次考试的信息的地方 -->
 <input type="text" value="${requestScope.grade.gscore }">
 <form id="form" action="DownLoadAction_Dow">
 <input name="gid" type="hidden" value="${requestScope.grade.gid }">
  <input name="name" type="hidden" value="${requestScope.name }">
 </form>
<div style="height:20px" ></div>
   <div >
    <table  style="margin-left:350px; margin-top:30px;" width="850" height="450"; border="2" >
    	<tr  align="center" style="font-size:26px;; font-weight:bolder; font-family:'宋体'">
    		<td style="width:190px">编号</td>
        	<td style="width:190px">试 题</td>
            <td style="width:110px ; text-align:left">学生答案</td>
            <td style="width:110px; text-align:right">正确答案</td>
            <td style="width:190px">对错</td>
        </tr>
        
        <s:iterator value="#request.listExam" var="exam" status="st">
        	<tr align="center" style="font-size:26px;; font-weight:bolder; font-family:'宋体'">
        	<td><s:property value="#st.index+1"/></td>
            <td><s:property value="#exam.exam"/></td>
            <td><s:property value="#exam.studentanswer"/></td>
            <td><s:property value="#exam.trueresult"/></td>
            <td>
			<s:if test="#exam.studentanswer==#exam.trueresult">对</s:if>
			<s:else>错</s:else>
			</td>
        </tr>
        </s:iterator>
        
        
        </table>
</div>
<div style="height:20px"></div>
<div>
	<button type="button" class="button" style="background-image:url(image/back.jpg) ; margin-left:500px; width:200px; height:60px;"></button>
    <button type="button" class="button" style="margin-left:200px; width:55px; height:55px; background:url(image/xiazai.jpg); font-size:18px" onclick="Dow();"></button>
</div>
</div>
  </body>
</html>
