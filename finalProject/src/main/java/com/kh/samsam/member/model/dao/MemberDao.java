package com.kh.samsam.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;
import com.kh.samsam.product.model.vo.Product;

@Repository
public class MemberDao {

	public int selectNewMember(SqlSessionTemplate sqlSession, MemberChart c) {
		int count = sqlSession.selectOne("memberMapper.selectNewMember", c);
		return count;
	}

	public int selectRemoveMember(SqlSessionTemplate sqlSession, MemberChart c) {
		int count = sqlSession.selectOne("memberMapper.selectRemoveMember", c);
		return count;
	}
	
public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
	return sqlSession.selectOne("memberMapper.loginMember",m);
	}

public int insertMember(SqlSessionTemplate sqlSession, Member m) {
	return sqlSession.insert("memberMapper.insertMember",m);
}

public int pwdChange(SqlSessionTemplate sqlSession, Member m) {
	// TODO Auto-generated method stub
	return sqlSession.update("memberMapper.pwdChange",m);
}

public int updateMember(SqlSessionTemplate sqlSession, Member m) {
	// TODO Auto-generated method stub
	return sqlSession.update("memberMapper.updateMember",m);
}

public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
	// TODO Auto-generated method stub
	return sqlSession.update("memberMapper.deleteMember",userId);
}

public int selectBanCount(SqlSessionTemplate sqlSession, String userId) {
	return 0;
}


//2022.07.24 알람 시작
public ArrayList<Product> successBid(SqlSessionTemplate sqlSession, String userId) {
	return (ArrayList)sqlSession.selectList("productMapper.successBid",userId);
}
public ArrayList<Product> successProduct(SqlSessionTemplate sqlSession, String userId) {
	return (ArrayList)sqlSession.selectList("productMapper.successProduct",userId);
}

public ArrayList<Product> failProduct(SqlSessionTemplate sqlSession, String userId) {
	return (ArrayList)sqlSession.selectList("productMapper.failProduct",userId);
}

public ArrayList<Product> topBid(SqlSessionTemplate sqlSession, String userId) {
	return (ArrayList)sqlSession.selectList("productMapper.topBid",userId);
}

//2022.07.24 알람 끝


	

}
