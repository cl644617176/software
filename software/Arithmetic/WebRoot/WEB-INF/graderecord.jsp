<%@page import="ljf.pojo.Grade"%>
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
    
    <title>My JSP 'graderecod.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" href="assets/css/style_jh.css">
	<script type="text/javascript">
		function NextPage(){
			var cur=parseInt(document.getElementById('askPageNum').value);
			var total=parseInt(document.getElementById('totalPages').value);
			if(cur==total){
				alert("世界的尽头已到！")
			}else{
			document.getElementById('askPageNum').value=parseInt(cur+1)
			document.getElementById('form').submit();
			}
		}
		
		function PreviousPage (){
			var cur=parseInt(document.getElementById('askPageNum').value);
			if(cur=='1'){
				alert("大虾！苦海无边回头是岸！")
			}else{
			document.getElementById('askPageNum').value=parseInt(cur-1)
			document.getElementById('form').submit();
			}
		}
		function GoL(n){
			alert(n);
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
					<li class="c1"><a href="index.html">主页</a></li>
					<li class="c2"><a href="person.html">个人中心</a></li>
					<li class="c3  active"><a href="GradeRecordAction_getRecord?askPageNum=1">试题查询</a></li>
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

		<header id="head" class="secondary" style="background:url(image/grade.png) no-repeat; background-size:cover">
            <div class="container">
                       
                </div>
   	    </header>
   		<div style="background:url(image/back8.jpg) no-repeat ; background-size:cover">
        <div >
        <h2  style="color:#933; float:left; font-weight:bolder; margin-left:100px;"> 成 绩 表</h2>
     	<br><br>
        <table style=" margin-top:30px;margin-left:150px; font-family:'宋体'; font-size:24px; font-weight:bolder; ">
        	<tr align="center">
            	<td width="120px">编    号</td>
                <td style="width:120px">难度级别</td>
           	    <td style="width:120px">成  绩</td>
                <td style="width:120px">用  时</td>
            </tr>
          
             <s:iterator value="#request.askList" var="grade" status="st">
             	<tr align="center" style="height: 80px;" >
             	
            	<td >
            	<s:url var="url" action="GradeRecordAction_gradeInfor">
             	<s:param name="InforGid" value="#grade.gid"> </s:param>
             	</s:url >
            	<s:a href="%{url}" title="查看详情"> <s:property value="#st.index+1"/></s:a>
            	
            	</td>
                <td >
              	 <s:if test="#grade.glevel=='primary'">
              	 初级
              	 </s:if>
                <s:if test="#grade.glevel=='medium'">
               		中级
                </s:if>
                <s:if test="#grade.glevel=='higher'">
               		高级
                </s:if>
                
                
                </td>
           	    <td ><s:property value="#grade.gscore"/></td>
                <td ><s:property value="#grade.gduration"/></td>
            	</tr>
            	
             </s:iterator>
           
        </table>
         <form id="form" action="GradeRecordAction_getRecord" style="float: left;">
        <button type="button" style=" margin-left:450px;margin-right:30px; margin-top:20px; margin-bottom:20px; background:#DADC7E" onclick="PreviousPage();">上一页</button>
        	第
       
        	<input id="askPageNum" name="askPageNum"  type="text" value="${requestScope.askPageNum}" style="border:0px;background:rgba(0, 0, 0, 0);width: 30px;text-align: center;"/>
       
      	  页
         <button type="button" style="background:#6ADF7C" onclick="NextPage();"/>下一页</button>
          </form>
          <input id="totalPages" type="hidden" value="${requestScope.totalPages}">
         
         <br>
         <button class="button" type="button" style="background:url(image/fanhui.jpg); height:40px; width:40px; margin-left:930px; margin-bottom:20px;" ></button>
        
        </div>
        
        	
       
        </div>
         <footer id="footer">
 
<div class="container" >
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
                </div><!-- end widget --> 
    </div>
  </div>
</div>
</div>
	</footer>
 	
  </body>
</html>
