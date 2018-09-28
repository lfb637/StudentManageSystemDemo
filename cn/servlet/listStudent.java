package cn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.entity.Page;
import cn.entity.Student;
import cn.service.PageService;
import cn.service.impl.PageServiceimp;

public class listStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request,response);
	}  
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum  = (int) request.getAttribute("pageNum"); //当前页数
		int pageSize = 5;     //每页5条数据
		PageService ps = new PageServiceimp();
		//获取Page对象，进行分页处理
		Page<Student> page = ps.findAllStudentWithPage(pageNum, pageSize);
		request.setAttribute("pageBean",page);  
		request.getRequestDispatcher("/pages/stuList.jsp").forward(request, response);
	}
}
