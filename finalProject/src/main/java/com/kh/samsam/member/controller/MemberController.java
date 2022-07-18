package com.kh.samsam.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagenation;
import com.kh.samsam.member.model.service.MemberService;
import com.kh.samsam.member.model.vo.Bid;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.Postbox;
import com.kh.samsam.member.model.vo.Product;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("login.me")
	   public String loginMember(Member m, HttpSession session, ModelAndView mv, String email, String address, String phone) {
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser == null) {
			mv.addObject("errorMsg","로그인 실패");
			
			mv.setViewName("common/errorPage");
		}else {
			String emailFirst = memberService.emailFirst(email);
			String emailBack = memberService.emailBack(email);
//			String phoneFirst = memberService.phoneFirst(phone);
//			String phoneMiddle = memberService.phoneMiddle(phone);
//			String phoneBack = memberService.phoneBack(phone);
			
			loginUser.setEmailFirst(emailFirst); //가져온 emailFirst를 Member객체로 선언한 loginUser라는 변수 안에있는 emailFirst로 넣어줘야한다.
			loginUser.setEmailBack(emailBack);
//			loginUser.setPhoneFirst(phoneFirst);
//			loginUser.setPhoneMiddle(phoneMiddle);
//			loginUser.setPhoneBack(phoneBack);
			
			
			session.setAttribute("loginUser", loginUser);
			
			mv.setViewName("redirect:/");
		}
		return "member/test";
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
		
		if(userPw!=null && userPwd!=null && !userPw.equals(userPwd)) {
			
			session.setAttribute("alertMsg", "이전 비밀번호와 동일하지 않습니다.");
			
			return "member/changePassword" ;
		}else {
			
			int result = memberService.pwdChange(m);
			
			if(newPwd!=null && newPwdCheck!=null && newPwd.equals(newPwdCheck)) {
				
				Member updatePwd = memberService.loginMember(m);
				
				String emailFirst = memberService.emailFirst(updatePwd.getEmail());
				String emailBack = memberService.emailBack(updatePwd.getEmail());
//				String phoneFirst = memberService.phoneFirst(updatePwd.getPhone());
//				String phoneMiddle = memberService.phoneMiddle(updatePwd.getPhone());
//				String phoneBack = memberService.phoneBack(updatePwd.getPhone());
				
				updatePwd.setEmailFirst(emailFirst); //가져온 emailFirst를 Member객체로 선언한 loginUser라는 변수 안에있는 emailFirst로 넣어줘야한다.
				updatePwd.setEmailBack(emailBack);
//				updatePwd.setPhoneFirst(phoneFirst);
//				updatePwd.setPhoneMiddle(phoneMiddle);
//				updatePwd.setPhoneBack(phoneBack);
				
				
				session.setAttribute("loginUser", updatePwd);
				
				session.setAttribute("alertMsg", "비밀번호가 변경되었습니다");
				return "redirect:/myInfo.me";
			}else {
				model.addAttribute("alertMsg", "새로운 비밀번호가 일지하지 않습니다.");
				return "member/changePassword" ;
				
			}
		
			
		}
		
		
		
		
//		int result = memberService.pwdChange(m);
//		if(result>0) { //비밀번호 변경 성공
//			Member updatePwd = memberService.loginMember(m);
//			session.setAttribute("loginUser", updatePwd);
//			
//		}else {
			
		
	}
	
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		MemberService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}

	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model, HttpServletRequest request) {
		
		String email = request.getParameter("emailFirst")+"@"+request.getParameter("emailBack");
		
		m.setEmail(email);
		
		int result = memberService.updateMember(m);
		
		if(result>0) { //성공
			//성공했으니 DB에 등록된 변경정보를 다시 조회해와서 세션에 담아야한다.
			Member updateMem = memberService.loginMember(m);
			
			String emailFirst = memberService.emailFirst(updateMem.getEmail());
			String emailBack = memberService.emailBack(updateMem.getEmail());
//			String phoneFirst = memberService.phoneFirst(updateMem.getPhone());
//			String phoneMiddle = memberService.phoneMiddle(updateMem.getPhone());
//			String phoneBack = memberService.phoneBack(updateMem.getPhone());
			
			updateMem.setEmailFirst(emailFirst); //가져온 emailFirst를 Member객체로 선언한 loginUser라는 변수 안에있는 emailFirst로 넣어줘야한다.
			updateMem.setEmailBack(emailBack);
//			updateMem.setPhoneFirst(phoneFirst);
//			updateMem.setPhoneMiddle(phoneMiddle);
//			updateMem.setPhoneBack(phoneBack);
			
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
				
//				System.out.println(userPw);
//				System.out.println(userId);
//				System.out.println(userPwd);
				
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
	
	@ResponseBody
	@RequestMapping(value="sale.me", produces="application/json; charset=UTF-8")
	public String sale(String userId, int cPage) {
		int currentPage = cPage;
		int listCount = memberService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> list = memberService.selectList(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		
		return new Gson().toJson(ob);
	}
	
	
	@RequestMapping("postBox.me")
	public String postBox() {
		return "common/postBox";
	}
	
	@RequestMapping("postInsert.me")
	public String postInsert(Postbox p,HttpSession session ,Model model) {
		
		int result = memberService.postInsert(p); 
		
		System.out.println(result);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "운송장 등록 완료");
			return "redirect:postBox.me";
			
		}else {//실패
			model.addAttribute("errorMsg","운송장 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="post.me", produces="application/json; charset=UTF-8")
	public String post(String userId, int pPage) {
		System.out.println(userId);
		int currentPage = pPage;
		int listCount = memberService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		System.out.println(pi);
		
		ArrayList<Postbox> list = memberService.selectListPost(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="attend.me", produces="application/json; charset=UTF-8")
	public String attend(String userId, int sPage) {
		System.out.println(userId);
		int currentPage = sPage;
		int listCount = memberService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		System.out.println(pi);
		
		ArrayList<Bid> list = memberService.selectListAttend(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="bid.me", produces="application/json; charset=UTF-8")
	public String bid(String userId, int bPage) {
		System.out.println(userId);
		int currentPage = bPage;
		int listCount = memberService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		System.out.println(pi);
		
		ArrayList<Bid> list = memberService.selectListBid(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	@RequestMapping(value = "myPageSuccess.me")
	   public String myPageSuccess() {
	      return "member/myPageSuccess";
	   }
	
	@RequestMapping("myPageSale.me")
	   public String myPageSale() {
	      return "member/myPageSale";
	   }
	
	@RequestMapping("myInfo.me")
	   public String myInfo() {
	      return "member/myInformation";
	   }
	
	@RequestMapping("changePwd.me")
	   public String changePassword() {
	      return "member/changePassword";
	   }
	
	
	
	@RequestMapping("pick.me")
	   public String interestItem() {
	      return "member/pick";
	   }
	
	@RequestMapping("salePostBox.me")
		public String salePostBox() {
			return "member/salePostBoxDetail";
	}

}
