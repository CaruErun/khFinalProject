package com.kh.samsam.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//public class LoginIntercepter extends HandlerInterceptorAdapter{
public class LoginIntercepter implements HandlerInterceptor{

	// preHandle: 전처리 - DispatcherServlet에서 컨트롤러를 호출하기 "전에" 요청을 낚아채는 메소드
	// postHandle: 후처리 - 컨트롤러에서 요청처리하고 DispatcherServlet으로 뷰 정보가 리턴되는 순간을 낚아채는 메소드
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(request.getHeader("Referer")==null) {
			
			session.setAttribute("alertMsg", "주소 직접 입력이 금지되어있습니다. 올바른 경로로 접속해주세요.");
			response.sendRedirect(request.getContextPath());
			return false;

		}else {	// 로그인 유저가 없을때 (로그인 상태가 아닐때)
			return true;
		}
	}

}
