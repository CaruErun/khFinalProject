package com.kh.samsam.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

//public class LoginInterceptor extends HandlerInterceptorAdapter {
public class LoginInterceptor implements HandlerInterceptor{

	//preHendle : 전처리 - DispatcherServlet에서 컨트롤러를 호출하기 "전에" 요청을 낚아채는 메소드 (url을 직접 수정하면 그 페이지로 이동하니까 그것을 막으려고!)
	//postHandle : 후처리 - controller에서 요청처리하고 DispatcherServlet으로 뷰 정보가 리턴되는 순간을 낚아채는 메소드

	//preHendle이라고 작성 후 자동완성!
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//내가 원하는 조건이 있으면 controller 요청에 가기 전에 이 조건을 확인하고
		//조건에 부합하면 true 아니면 false를 return 시켜서
		//true일 떈 controller 요청 실행
		//false일 땐 controller 요청 실행 XX
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")!=null) {
			
			return true;
			
		}else { //로그인 유저가 없을 때 (로그인 상태가 아닐 때)

			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다 ㅎㅎ..");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}
}
