package com.kh.samsam.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.member.model.dao.MemberDao;
import com.kh.samsam.member.model.vo.MemberChart;

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

}
