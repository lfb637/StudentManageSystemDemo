package cn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.entity.Grade;
import cn.entity.Student;
import cn.service.GradeService;
import cn.service.StudentService;
import cn.service.impl.GradeServiceimp;
import cn.service.impl.StudentServiceimp;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-11  All rights reserved.
 *
 * @ class description锛氭坊鍔犲鐢熷埌鏁版嵁搴擄紝
 *
 */
public class addStudent extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public addStudent() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
	}
    
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("stuName");
		String sex  = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("stuAge"));
		String gradeName = request.getParameter("stuGrade");
		String profile = request.getParameter("showProfile");
		GradeService gService = new GradeServiceimp();
		Grade grade = gService.getGrade(gradeName);  //由年级名获取年级ID
		Student stu = new Student();
		stu.setName(name);
		stu.setAge(age);
		stu.setSex(sex);
		stu.setProfile(profile);
		stu.setGradeId(grade.getGradeId());
		StudentService studentService = new StudentServiceimp();
		if(studentService.findStudent(stu)){               //如果数据库中已有该学生则回转到列表页面
			response.sendRedirect("/Student/pages/stuList.jsp");
		}else{         
			String opr = request.getParameter("opr");  //判断执行的操作
			int n = 0;  //标志
			if(opr.equals("addStu")){
				n = studentService.addStudent(stu);
			}else if(opr.equals("modifyStu")){
				int id = Integer.parseInt(request.getParameter("stuId"));
				stu.setId(id);
				n = studentService.modifyStudent(stu);
			}
			if(n>0){  //操作成功
				response.sendRedirect("/Student/pages/stuList.jsp");
			}else{   //操作失败
				response.sendRedirect("/Student/pages/addStu.jsp");
			}
			
		}
	}
}


