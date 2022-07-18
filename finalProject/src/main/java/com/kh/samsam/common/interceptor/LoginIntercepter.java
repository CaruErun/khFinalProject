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
		
		// 내가 원하는 조건이 있으면 controller요청에 가기전에 이 조건을 확인하고
		// 조건에 부합하면 true 아니면 false를 return 시켜서
		// true일땐 controller요청 실행
		// false일땐 controller요청 실행 XX
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			
			return true;
		}else {	// 로그인 유저가 없을때 (로그인 상태가 아닐때)
			
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}

}
