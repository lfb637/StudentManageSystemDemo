<%@page import="cn.entity.Grade"%>
<%@page import="cn.service.GradeService"%>
<%@page import="cn.service.impl.GradeServiceimp"%>
<%@page import="cn.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="cn.service.StudentService"%>
<%@page import="cn.service.impl.StudentServiceimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<title>学生信息列表</title>
<script type="text/javascript">
  function check(){
    var mymessage=confirm("确定要删除吗？");  
    if(mymessage==true){  
       return true;    
    }  
    else if(mymessage==false){  
       return false;
    }   
  }
</script>
<script type="text/javascript">    
   function getkey(a) {     
	   var pms = 'key='+document.getElementById("search").value; 
       a.href = 'searchStu.jsp?'+pms;  
    }
</script>
</head>
<body>
<div align="right">欢迎你，${user.username } &nbsp;&nbsp;&nbsp;<a href="logout.jsp">退出</a></div>
<h2>学生列表</h2>
    <p id = "addStu"><a href="addStu.jsp"><input type="button" value="添加学生"></a></p>
    <br/>
    <p>
      <input type = "text" id = "search" name = "search" placeholder = "输入学生姓名"/>
       <span><a href="searchStu.jsp" onclick="getkey(this)">搜索</a></span>
    </p>
<table class="table  table-bordered table-hover table-condensed">
   <thead>
	  <tr>
	    <td class="listTable">编号</td>
	    <td class="listTable">姓名</td>
	    <td class="listTable">性别</td>
	    <td class="listTable">年龄</td>
	    <td class="listTable">学历</td>
	    <td id="profile">自我介绍</td>
	    <td id="operate">操作</td>
	  </tr>
  </thead>
<%--第一种写法，使用JSP原生标签 --%>
<%
   session.removeAttribute("list");
   StudentService stuService = new StudentServiceimp();
   GradeService gradeService = new GradeServiceimp();
   Grade grade = new Grade();
   List<Student> list = stuService.getAllStudent();
   session.setAttribute("list", list);
   for(Student stu:list){
    grade.setGradeId(stu.getGradeId());
    grade = gradeService.getGrade(grade);
 %>
  <tr>    
   <td><%=stu.getId() %> </td>
   <td><%=stu.getName() %> </td>
   <td><%=stu.getSex() %> </td>
   <td><%=stu.getAge() %> </td>
   <td><%=grade.getGradeName() %></td>
   <td><%=stu.getProfile() %> </td>
   <td><a href="stuDetail.jsp?id=<%=stu.getId() %>">查看&nbsp;&nbsp;</a>
   <a href="modifyStu.jsp?id=<%=stu.getId() %>">修改&nbsp;&nbsp;</a>
   <a href="${pageContext.request.contextPath }/servlet/delStudent?id=<%=stu.getId() %>" onclick="return check()">删除&nbsp;&nbsp;</a></td>
  </tr>
  <% }%>
                   
<%--第二种写法，使用JSTL标签 --%>
<%--  <%
   StudentService stuService = new StudentServiceimp();
   GradeService gradeService = new GradeServiceimp(); 
   Grade grade = new Grade(); 
   List<Student> list = stuService.getAllStudent();
   session.setAttribute("list", list);
   for(Student stu:list){
	   grade.setGradeId(stu.getGradeId());
	   grade = gradeService.getGrade(grade);
   }
 %>
<c:forEach items="${list}" var="stu">
  <tr> 
   <td>${stu.id } </td>
   <td>${stu.name }</td>
   <td>${stu.sex }</td>
   <td>${stu.age }</td>
   <td><%=grade.getGradeName()%> </td>
   <td>${stu.profile }</td>
   <td><a href="stuDetail.jsp">查看&nbsp;&nbsp;</a>
   <a href="modifyStu.jsp">修改&nbsp;&nbsp;</a>
   <a href="#">删除&nbsp;&nbsp;</a></td>
  </tr> 
</c:forEach> --%>
</table>

<%-- 构建分页导航 --%>
<form action = "list" method = "post">
            共有${pageBean.totalRecord}个学生，共${requestScope.pageBean.totalPage }页，当前为${requestScope.pageBean.pageNum}页
            <br/>
            <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum ==1}">
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>                
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>                    
            </c:if>
            
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum > 1 && requestScope.pageBean.pageNum < requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">    
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>            
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>    
            </c:if>
            
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${requestScope.pageBean.pageNum == requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${i}">${i}</a>                                        
                    </c:if>                
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <a href="${pageContext.request.contextPath}/FindAllWithPage?pageNum=${requestScope.pageBean.totalPage}">尾页</a>
            </form>
</body>
</html>