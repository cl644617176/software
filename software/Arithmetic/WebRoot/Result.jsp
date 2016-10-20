<%@page import="ljf.pojo.Exam"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <% 
  List<Exam> list=(List<Exam>)session.getAttribute("examList");
   for(int i=0;i<20;i++){
      list.get(i).setStudentanswer(request.getParameter(i+""));
      } 
      session.setAttribute("examList", list);
      out.print(list.get(0).getStudentanswer());
      out.print(list.get(1).getStudentanswer());
      
      %>
<form action="ExamAction_endExam" method="get">
<input type="submit" value="结束考试" />
</form>
  </body>
</html>
