package com.kh.samsam.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.samsam.common.model.vo.PageInfo;
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
	//아이디 중복 검사
	public int check_id(SqlSessionTemplate sqlSession, String id){
		return sqlSession.selectOne("memberMapper.check_id", id);
	}
	
	// 이메일 중복 검사
	public int check_email(SqlSessionTemplate sqlSession,String email) throws Exception{
		return sqlSession.selectOne("memberMapper.check_email", email);
	}
//아이디 찾기
	public String find_id(SqlSessionTemplate sqlSession, String email) throws Exception{
		return sqlSession.selectOne("memberMapper.find_id", email);
	}
// 비밀번호 변경
		@Transactional
		public int update_pw(SqlSessionTemplate sqlSession, Member m){
			return sqlSession.update("memberMapper.update_pw", m);
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

public int selectBanCount(SqlSessionTemplate sqlSession, String reportedId) {
	return sqlSession.selectOne("memberMapper.selectBanCount", reportedId);
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


public int banMember(SqlSessionTemplate sqlSession, Member m) {
	return sqlSession.update("memberMapper.banMember", m);
}



public int deleteReport(SqlSessionTemplate sqlSession, int reportNo) {
	return sqlSession.update("memberMapper.deleteReport", reportNo);
}

public int nobanMember(SqlSessionTemplate sqlSession, int reportNo) {
	return sqlSession.update("memberMapper.nobanMember", reportNo);
}


//====찜리스트====
//페이징 처리 게시글 count
public int selectPListCount(SqlSessionTemplate sqlSession, String userId) {
	
	return sqlSession.update("productMapper.selectPListCount",userId);
}

//찜리스트 출력
public ArrayList<Product> pickList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
	
	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	

	
	return (ArrayList)sqlSession.selectList("productMapper.pickList",userId,rowBounds);
}

}
