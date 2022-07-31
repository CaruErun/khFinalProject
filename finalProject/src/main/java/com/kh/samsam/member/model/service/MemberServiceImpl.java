package com.kh.samsam.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.samsam.member.model.dao.MemberDao;
import com.kh.samsam.member.model.vo.MemberChart;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.dao.MemberDao;
import com.kh.samsam.member.model.vo.Bid;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.Postbox;
import com.kh.samsam.member.model.vo.Product;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	@Inject
	private MemberDao manager;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Override
	public int selectNewMember(MemberChart c) {
		int count = memberDao.selectNewMember(sqlSession, c);
		return count;
	}

	@Override
	public int selectRemoveMember(MemberChart c) {
		int count = memberDao.selectRemoveMember(sqlSession, c);
		return count;
	}
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession,m);
		
		return loginUser;
	}
	

	
	@Override
	public int insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession,m);
		
		return result;
	}
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_id(sqlSession,id));
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_email(sqlSession, email));
		out.close();
	}
	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = manager.find_id(sqlSession, email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public String emailFirst(String email) {
		// TODO Auto-generated method stub
		String emailFirst = memberDao.emailFirst(sqlSession,email);
		
		return emailFirst;
	}
	
	// 이메일 발송
		@Override
		public void send_mail(Member m, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "dlckswn91@naver.com";
			String hostSMTPpwd = "8yucd6";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "dlckswn91@naver.com";
			String fromName = "Spring Homepage";
			String subject = "";
			String msg = "";
			
			if(div.equals("find_pw")) {
				subject = "SAMSAM AUCTION 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += m.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += m.getUserPw() + "</p></div>";
			}
			// 받는 사람 E-Mail 주소
			String mail = m.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
		
		// 비밀번호 찾기
		@Override
		public void find_pw(HttpServletResponse response, Member m) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 아이디가 없으면
			if(memberDao.check_id(sqlSession, m.getUserId()) == 0) {
				out.print("아이디가 없습니다.");
				out.close();
			}
//			// 가입에 사용한 이메일이 아니면
//			else if(!m.getEmail().equals(manager.loginMember(m.getUserId()).getEmail())) {
//				out.print("잘못된 이메일 입니다.");
//				out.close();
			else{
				// 임시 비밀번호 생성
				
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				
				m.setUserPw(pw);
				// 비밀번호 변경
				// 비밀번호 변경 메일 발송
				send_mail(m, "find_pw");
				String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());
				System.out.println("암호화 후 비밀번호 : "+encPwd);
				m.setUserPw(encPwd);
				memberDao.update_pw(sqlSession, m);
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}

	@Override
	public String emailBack(String email) {
		// TODO Auto-generated method stub
		String emailBack = memberDao.emailBack(sqlSession,email);
		
		return emailBack;
	}

	@Override
	public String phoneFirst(String phone) {
		// TODO Auto-generated method stub
		String phoneFirst = memberDao.phoneFirst(sqlSession,phone);
		
		return phoneFirst;
	}

	@Override
	public String phoneMiddle(String phone) {
		// TODO Auto-generated method stub
		String phoneMiddle = memberDao.phoneMiddle(sqlSession,phone);
		
		return phoneMiddle;
	}

	@Override
	public String phoneBack(String phone) {
		// TODO Auto-generated method stub
		String phoneBack = memberDao.phoneBack(sqlSession,phone);
		
		return phoneBack;
	}

	@Override
	public int pwdChange(Member m) {
		// TODO Auto-generated method stub
		int result = memberDao.pwdChange(sqlSession,m);
		return result;
	}


	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSMHEFPTZLZ6P06";
	    String api_secret = "RYH3QUQ0PLZOOVNPWGPZVYP5RT85SVPD";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01092515043");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		int result = memberDao.updateMember(sqlSession,m);
		
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		int result = memberDao.deleteMember(sqlSession,userId);
		
		return result;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		int count = memberDao.selectListCount(sqlSession);
		
		return count;
	}

	@Override
	public ArrayList<Product> selectList(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectList(sqlSession,pi,userId);
	}

	@Override
	public int postInsert(Postbox p) {
		// TODO Auto-generated method stub
		return memberDao.postInsert(sqlSession,p);
	}

	@Override
	public ArrayList<Postbox> selectListPost(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectListPost(sqlSession,pi,userId);
	}

	@Override
	public ArrayList<Bid> selectListAttend(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectListAttend(sqlSession,pi,userId);
	}

	@Override
	public ArrayList<Bid> selectListBid(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.selectListBid(sqlSession,pi,userId);
	}

}
