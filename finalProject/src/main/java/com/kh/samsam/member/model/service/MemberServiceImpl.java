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
import com.kh.samsam.member.model.vo.Member;

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
	    params.put("to", userPhoneNumber);    // ??????????????????
	    params.put("from", "010");    // ??????????????????. ?????????????????? ??????,?????? ?????? ?????? ????????? ?????? ???
	    params.put("type", "SMS");
	    params.put("text", "[TEST] ???????????????" + "["+randomNumber+"]" + "?????????."); // ?????? ?????? ??????
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



	

	// ?????? ?????? ?????? ?????? - banCount ??????
	@Override
	public int selectBanCount(String userId) {
		return memberDao.selectBanCount(sqlSession, userId);
	}

}
