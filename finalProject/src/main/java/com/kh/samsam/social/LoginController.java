package com.kh.samsam.social;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.samsam.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@ResponseBody
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		System.out.println("ajax check");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
//		session.setAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return naverAuthUrl;
//		return "login";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("/callback")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    System.out.println(apiResult);
	  //2. String형식인 apiResult를 json형태로 바꿈		
	  		JSONParser parser = new JSONParser();		
	  		Object obj = parser.parse(apiResult);
	  		JSONObject jsonObj = (JSONObject) obj;			
	  		//3. 데이터 파싱 		
	  		//Top레벨 단계 _response 파싱
	  		JSONObject response_obj = (JSONObject)jsonObj.get("response");	
	  		//response의 nickname값 파싱
	  		String name = (String)response_obj.get("name");
	  		System.out.println(name);			
	  		//4.파싱 닉네임 세션으로 저장
	  		Member loginUser = new Member();
	  		loginUser.setUserName(name);
	  		session.setAttribute("loginUser",loginUser); //세션 생성
	    
		model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */
//		return "member/naverSuccess";
		return "main";
	}
}