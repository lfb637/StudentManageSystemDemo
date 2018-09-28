<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@page import="cn.entity.Grade"%>
<%@page import="cn.service.GradeService"%>
<%@page import="cn.service.impl.GradeServiceimp"%>
<%@page import="cn.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="cn.service.StudentService"%>
<%@page import="cn.service.impl.StudentServiceimp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
<div align="right">欢迎你，${user.username } &nbsp;&nbsp;&nbsp;<a href="logout.jsp">退出</a></div>
<h2>学生列表</h2>
<p id="addStu"><a href="addStu.jsp"><input type="button" value="添加学生"></a></p>
<form action = "${pageContext.request.contextPath }/test" method = "post">
<table class="table  table-bordered table-hover table-condensed">
   <caption>学生列表 - 共${pageBean.totalRecord}人</caption>
   <thead>
	  <tr>
	    <td class="listTable">编号</td>
	    <td class="listTable">姓名</td>
	    <td class="listTable">性别</td>
	    <td class="listTable">年龄</td>
	    <td class="listTable">年级</td>
	    <td id="profile">自我介绍</td>
	    <td id="operate">操作</td>
	  </tr>
  </thead>
  <c:forEach items="${list}" var="stu">
   <tr> 
	   <td>${stu.id } </td>
	   <td>${stu.name }</td>
	   <td>${stu.sex }</td>
	   <td>${stu.age }</td>
	   <td>${stu.gradeId }</td>
	   <td>${stu.profile }</td>
	   <td><a href="stuDetail.jsp?id=${stu.id }">查看&nbsp;&nbsp;</a>
           <a href="modifyStu.jsp?id=${stu.id }">修改&nbsp;&nbsp;</a>
           <a href="${pageContext.request.contextPath }/servlet/delStudent?id=${stu.id }" onclick="return check()">删除&nbsp;&nbsp;</a>
       </td>
  </tr> 
</c:forEach>
</table> 
            <br/>
            <a href="?pageNum=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum==1}">
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>                
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>                    
            </c:if>
            
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum > 1 && requestScope.pageBean.pageNum < requestScope.pageBean.totalPage}">
                <a href="?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">    
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>            
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>    
            </c:if>
            
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${requestScope.pageBean.pageNum == requestScope.pageBean.totalPage}">
                <a href="?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="?pageNum=${i}">${i}</a>                                        
                    </c:if>                
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <a href="?pageNum=${requestScope.pageBean.totalPage}">尾页</a>
</form>    