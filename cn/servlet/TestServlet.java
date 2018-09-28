package cn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cn.entity.Grade;
import cn.entity.Page;
import cn.entity.Student;
import cn.service.GradeService;
import cn.service.PageService;
import cn.service.StudentService;
import cn.service.impl.GradeServiceimp;
import cn.service.impl.PageServiceimp;
import cn.service.impl.StudentServiceimp;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public TestServlet() {
        super();  
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    StudentService stuService = new StudentServiceimp();
		    List<Student> list = stuService.getAllStudent(); //学生集合
		    int pageNum  = (int) request.getAttribute("pageNum"); // 当前页数
			int pageSize = 5;     //每页5条数据
			PageService ps = new PageServiceimp();
			//获取Page对象，进行分页处理
			Page<Student> page = ps.findAllStudentWithPage(pageNum, pageSize);
			request.setAttribute("list", list);
			request.setAttribute("pageBean",page);  
			request.getRequestDispatcher("/pages/stuList.jsp").forward(request, response);
    }
}
