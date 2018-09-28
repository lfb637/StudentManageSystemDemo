package cn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.entity.User;
import cn.service.UserService;
import cn.service.impl.UserServiceimp;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：处理登录请求
 *
 */
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		request.setAttribute("username",userName);
		request.setAttribute("password",password);
		if(userName!=null && !userName.equals("")){
			UserService uerService = new UserServiceimp();
			User user = new User();
			user.setUsername(userName);
			user.setPassword(password);
			if(uerService.findUser(user)){   //存在这个用户，可以正常访问学生信息
				request.getSession().setAttribute("user", user);
				response.sendRedirect("/Student/pages/stuList.jsp");	
			}else{              //不存在这个用户，给出提示，转回登录页面
				String message = "用户名或密码错误";
				request.getSession().setAttribute("msg", message);
				response.sendRedirect("/Student/login.jsp");
				/*request.getSession().setAttribute("msg","用户名或密码错误");
			    request.getRequestDispatcher("/login.jsp").forward(request, response);*/
			}
		}	
	}
}


