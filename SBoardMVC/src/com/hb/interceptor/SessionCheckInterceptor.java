package com.hb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hb.vo.MemberVO;

public class SessionCheckInterceptor 
extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session != null){
			Object obj = session.getAttribute("ddd");
			if(obj!=null){
				return true;
			}
		}
		response.sendRedirect("redirect:/SBoardMVC/login");
		return false;
	}
}






