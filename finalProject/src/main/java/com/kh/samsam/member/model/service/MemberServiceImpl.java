package com.kh.samsam.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.member.model.dao.MemberDao;
import com.kh.samsam.member.model.vo.MemberChart;

import java.util.ArrayList;
import java.util.HashMap;

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
	@Autowired
	private SqlSessionTemplate sqlSession;

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
	public String emailFirst(String email) {
		// TODO Auto-generated method stub
		String emailFirst = memberDao.emailFirst(sqlSession,email);
		
		return emailFirst;
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
	    params.put("from", "");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
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
