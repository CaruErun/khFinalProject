package com.kh.samsam.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.member.model.service.MailSendService;
import com.kh.samsam.member.model.service.MemberService;
import com.kh.samsam.member.model.service.MemberServiceImpl;
import com.kh.samsam.member.model.vo.Member;




@Controller  
public class MemberController {
			
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m
							,HttpSession session
							,ModelAndView mv) {
		
		
		Member loginUser = memberService.loginMember(m);
		
		System.out.println(m);		
		System.out.println(bcryptPasswordEncoder.encode("admin"));
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			
		
			
			
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(Member m
							  ,HttpSession session
							  ,Model model) {
		
			
		System.out.println("암호화 전 비밀번호 : "+m.getUserPw());
		
		//암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());
		
		System.out.println("암호화 후 비밀번호 : "+encPwd);
		
		//암호화 된 pwd를 Member m 에 담아주기 (평문과 바꿔치기)
		m.setUserPw(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입 성공!");
			return "redirect:/";
		}else {
			 
			model.addAttribute("errorMsg","회원가입 실패!");
			return "common/errorPage";
		}
		
	}

	@Autowired
	private MailSendService mailService;
	

	
	//이메일 인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
	
	

}
