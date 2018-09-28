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
 * @ class description 
 *
 */
public class searchStudent extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public searchStudent() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
	}
    
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*StudentService studentService = new StudentServiceimp();
		Student stu = studentService.searchStudent("刘德华");
		System.out.println(stu.getAge());
		request.setAttribute("stu",stu);*/
    }
}


