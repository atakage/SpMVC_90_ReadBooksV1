package com.biz.rbooks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		
		HttpSession httpSession = request.getSession();
		Object sessionObj = httpSession.getAttribute("MEMBERVO");
		
		if(sessionObj  == null) {
			
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	
	
	
}
