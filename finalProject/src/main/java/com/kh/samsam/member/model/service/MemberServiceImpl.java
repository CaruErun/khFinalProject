package com.kh.samsam.member.model.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.member.model.dao.MemberDao;
import com.kh.samsam.member.model.vo.Member;

//@Component
@Service
public class MemberServiceImpl implements MemberService{
	
//	private MemberDao memberDao = new MemberDao();
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

	

}
