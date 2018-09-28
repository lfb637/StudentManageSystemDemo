<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户首页</title>
  </head>
  <body style="text-align:center">
    <h1><font color = "green">欢迎使用学生管理系统</font></h1>
    <h2><a href="login.jsp" >点击进入</a></h2>
  </body>
</html>
