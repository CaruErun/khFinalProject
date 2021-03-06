package com.kh.samsam.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.member.model.service.MailSendService;
import com.kh.samsam.member.model.service.MemberService;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	// 차트 신규 회원
	@RequestMapping("new.me")
	public ModelAndView selectNewMember(ModelAndView mv) {

		MemberChart[] narr = new MemberChart[12];
		
		narr[0] = new MemberChart("2022-01-01", "2022-01-31");
		narr[1] = new MemberChart("2022-02-01", "2022-02-28");
		narr[2] = new MemberChart("2022-03-01", "2022-03-31");
		narr[3] = new MemberChart("2022-04-01", "2022-04-30");
		narr[4] = new MemberChart("2022-05-01", "2022-05-31");
		narr[5] = new MemberChart("2022-06-01", "2022-06-30");
		narr[6] = new MemberChart("2022-07-01", "2022-07-31");
		narr[7] = new MemberChart("2022-08-01", "2022-08-31");
		narr[8] = new MemberChart("2022-09-01", "2022-09-30");
		narr[9] = new MemberChart("2022-10-01", "2022-10-31");
		narr[10] = new MemberChart("2022-11-01", "2022-11-30");
		narr[11] = new MemberChart("2022-12-01", "2022-12-31");
		
		int[] countArr = new int[12];
		
		for(int i=0; i<countArr.length; i++) {
			countArr[i] = memberService.selectNewMember(narr[i]);
		}
		
		double most = 0;
		for(int i=0; i<countArr.length; i++) {
			if(countArr[i]>most){
				most=countArr[i];
			}
		}
		most = most*1.1;
		
		MemberChart MemberChartNew = new MemberChart(countArr, most);
		
		mv.addObject("MemberChartNew", MemberChartNew);
		mv.setViewName("member/chartNewMember");
		return mv;
	}
	// 차트 탈퇴 회원
	@RequestMapping("remove.me")
	public ModelAndView selectRemoveMember(ModelAndView mv) {
		
		MemberChart[] rarr = new MemberChart[12];

		rarr[0] = new MemberChart("2022-01-01", "2022-01-31");
		rarr[1] = new MemberChart("2022-02-01", "2022-02-28");
		rarr[2] = new MemberChart("2022-03-01", "2022-03-31");
		rarr[3] = new MemberChart("2022-04-01", "2022-04-30");
		rarr[4] = new MemberChart("2022-05-01", "2022-05-31");
		rarr[5] = new MemberChart("2022-06-01", "2022-06-30");
		rarr[6] = new MemberChart("2022-07-01", "2022-07-31");
		rarr[7] = new MemberChart("2022-08-01", "2022-08-31");
		rarr[8] = new MemberChart("2022-09-01", "2022-09-30");
		rarr[9] = new MemberChart("2022-10-01", "2022-10-31");
		rarr[10] = new MemberChart("2022-11-01", "2022-11-30");
		rarr[11] = new MemberChart("2022-12-01", "2022-12-31");
		
		int[] countArr = new int[12];
		for(int i=0; i<countArr.length; i++) {
			countArr[i] = memberService.selectRemoveMember(rarr[i]);
		}
		
		double most = 0;
		for(int i=0; i<countArr.length; i++) {
			if(countArr[i]>most){
				most=countArr[i];
			}
		}
		most = most*1.1;
		
		MemberChart MemberChartRemove = new MemberChart(countArr, most);
		
		mv.addObject("MemberChartRemove", MemberChartRemove);
		mv.setViewName("member/chartRemoveMember");
		
		return mv;
	}
	@RequestMapping("login.me")
	   public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, String email, String address, String phone) {
		Member loginUser = memberService.loginMember(m);
		
		System.out.println(bcryptPasswordEncoder.encode(m.getUserPw()));
		
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
	
	

	@RequestMapping("myPageSale.me")
	public String myPageSale() {
		return "member/myPageSale";
		   }
		
	@RequestMapping("pwdChangeHome.me")
	public String pwdChangeHome() {
		
		return "member/changePassword";
	}
	
	@RequestMapping("pwdChange.me")
	public String pwdChange(Member m, HttpSession session, Model model) {
		
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		String userPw = ((Member)session.getAttribute("loginUser")).getUserPw();
		
		String userPwd = m.getUserPwd();
		String newPwd = m.getNewPwd();
		String newPwdCheck = m.getNewPwdCheck();
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());
		
//		if(userPw!=null && userPwd!=null && !userPw.equals(userPwd)) {
			
			if(!bcryptPasswordEncoder.matches(userPwd,encPwd)) {
				
//			if(bcryptPasswordEncoder.matches(userPw, encPwd)) {
			
			session.setAttribute("alertMsg", "이전 비밀번호와 동일하지 않습니다.");
			
			return "member/changePassword" ;
		}else {
			
			int result = memberService.pwdChange(m);
			
//			if(newPwd!=null && newPwdCheck!=null && newPwd.equals(newPwdCheck)) {
			if(bcryptPasswordEncoder.matches(userPwd,encPwd)) {
				
				Member updatePwd = memberService.loginMember(m);
				
				session.setAttribute("loginUser", updatePwd);
				
				session.setAttribute("alertMsg", "비밀번호가 변경되었습니다");
				return "redirect:/myInfo.me";
			}else {
				model.addAttribute("alertMsg", "새로운 비밀번호가 일지하지 않습니다.");
				return "member/changePassword";
			}
		}
				
			}
			
	
	
	@RequestMapping("myInfo.me")
	   public String myInfo() {
	      return "member/myInformation";
	   }
	
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		
		int result = memberService.updateMember(m);
		
		if(result>0) { //성공
			//성공했으니 DB에 등록된 변경정보를 다시 조회해와서 세션에 담아야한다.
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "정보 수정 성공");
			return "redirect:myInfo.me" ;
			
		}else { //실패
			model.addAttribute("errorMsg","회원 정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.me")
	public String myDelete() {
		return "member/myDeleteRePassword";
	}
	
	@RequestMapping("deleteRe.me")
	public String myDeleteRePassword(Member m,HttpSession session, Model model) {
		
				String userPw = ((Member)session.getAttribute("loginUser")).getUserPw();
				String userId = ((Member)session.getAttribute("loginUser")).getUserId();
				
				String userPwd = m.getUserPwd();
				
				
				//비밀번호가 일치할 경우 - 탈퇴 처리
				if(userPw!=null && userPwd!=null && userPw.equals(userPwd)) {
					int result = memberService.deleteMember(userId);
					
					
					if(result>0) {
						//탈퇴성공 - session에 등록된 loginUser정보 삭제(로그아웃)
						session.removeAttribute("loginUser");
						
						session.setAttribute("alertMsg", "만나서 즐거웠고 다신보지말자");
						
						return "redirect:myPageSuccess.me"; //메인으로 갈 예정 
						
					}else {
						//탈퇴실패
						model.addAttribute("errorMsg","회원 탈퇴 실패");
						return "common/errorPage";
					}
					//비밀번호가 틀릴경우
				}else {
					session.setAttribute("alertMsg", "비밀번호를 잘못입력하셨습니다.");
					return "common/errorPage";
				}
			
	}
	
	
	@RequestMapping(value = "myPageSuccess.me")
	   public String myPageSuccess() {
	      return "member/myPageSuccess";
	   }
	
	
	
	
	
	@RequestMapping("changePwd.me")
	   public String changePassword() {
	      return "member/changePassword";
	   }
	
	
	
	@RequestMapping("pick.me")
	   public String interestItem() {
	      return "member/pickList";
	   }
	
	@RequestMapping("salePostBox.me")
		public String salePostBox() {
			return "member/salePostBoxDetail";
	}
	
	// 신고 당한 회원 정지
	@RequestMapping("ban.me")
	public ModelAndView banMember(ModelAndView mv, String userId, HttpSession session ) {
		
		System.out.println(userId);
		// banCount조회
		int banCount = memberService.selectBanCount(userId);
		System.out.println(banCount);
		int banDate = 0;
//		switch(banCount) {
//			case 0: memberService.banMember(userId);
//					break;
//			case 1: memberService.banMember(userId);
//					break;
//			default: memberService.banMember(userId);
//					break;
//		}
		
		return mv;
	}
	

}






