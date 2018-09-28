<%@page import="cn.service.impl.StudentServiceimp"%>
<%@page import="cn.service.StudentService"%>
<%@page import="cn.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  function check() {
		for (var i = 0; i < document.form2.elements.length - 1; i++) {
			if (document.form2.elements[i].value == "") {
				alert("当前表单不能有空项");
				document.form2.elements[i].focus();    //聚集到缺省处
				return false;
			}
		}
		    return true;
		}
</script>
</head>
<body>
<h2>修改学生信息</h2>
<form action="${pageContext.request.contextPath }/servlet/addStudent?opr=modifyStu" name="form2" method="post" onsubmit = "return check()">
  <table id="stuDetailList">
  <%
	   int id = Integer.parseInt(request.getParameter("id"));
	   StudentService studentService = new StudentServiceimp();
	   Student stu = new Student();
	   stu.setId(id);
	   stu = studentService.getStudentMoreInfo(stu);
  %>
  <tr>   
     <td>姓名：</td> 
    <td><input type="text" name="stuName" value="<%=stu.getName() %>"></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td><input type="radio" name="sex" value="男" checked="checked">男<input type="radio" name="sex" value="女">女</td>
  </tr>
    <tr>
    <td>年龄：</td>
    <td><input type="text" name="stuAge" value="<%=stu.getAge() %>"></td>
  </tr>
  <tr>
    <td>学历：</td>
    <td><select name="stuGrade">
         <option value="学士" selected="selected">学士</option> <!--默认为-->
         <option value="硕士">硕士</option>
         <option value="博士">博士</option>
         <option value="博士后">博士后</option>
       </select>
    </td>
  </tr>
    <tr>
    <td>自我介绍：</td>
    <td><textarea name="showProfile" cols="40" rows="6" ><%=stu.getProfile() %></textarea></td>
  </tr>
   <tr>
       <td><input type="hidden" name="stuId" value="<%=id %>"></td>
       <td colspan="2" style="text-align: center"><input type="submit" value="提交信息"></td>
   </tr>
  </table>
</form>
</body>
</html>