package cn.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-11  All rights reserved.
 *
 * @ class description�������û���¼������¼�Ͳ��ܷ���ѧ����Ϣ
 *
 */
public class LoginFillter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest  req = (HttpServletRequest)request;
		HttpServletResponse rsp = (HttpServletResponse)response;
		User user = (User)req.getSession().getAttribute("user");
		if(user==null){
			rsp.sendRedirect("/Student/error.jsp");
		}else{
			chain.doFilter(request, response);
		}
	}
	@Override
	public void destroy() {
	}
}


