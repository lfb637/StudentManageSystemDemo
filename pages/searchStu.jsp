<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生搜索</title>
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <h3 align = "center"><font color = "blue">查询学生信息如下</font></h3>
  <form action = "${pageContext.request.contextPath}/search" method = "POST"></form>
  <table class="table  table-nobordered table-hover table-condensed">
   <%--  <%   
        String name = request.getParameter("key");
        request.getRequestDispatcher("searchStu.jsp").forward(request,response);
    %>  --%>
   <thead>
	  <tr>
	    <td class="listTable">编号</td>
	    <td class="listTable">姓名</td>
	    <td class="listTable">性别</td>
	    <td class="listTable">年龄</td>
	   <!--  <td class="listTable">学历</td> -->
	    <td id="profile">自我介绍</td>
	  </tr>
  </thead>
  <tr> 
   <td>${stu.id } </td>
   <td>${stu.name }</td>
   <td>${stu.sex }</td>
   <td>${stu.age }</td>
  <%--  <td><%=grade.getGradeName()%> </td> --%>
   <td>${stu.profile }</td>
  </tr> 
  </table>     
</body>
</html>