package com.kh.samsam.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.Bid;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;
import com.kh.samsam.member.model.vo.Postbox;
import com.kh.samsam.member.model.vo.Product;

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
	public int check_id(SqlSessionTemplate sqlSession, String id) throws Exception{
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

public String emailFirst(SqlSessionTemplate sqlSession, String email) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.emailFirst",email);
	}

public String emailBack(SqlSessionTemplate sqlSession, String email) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.emailBack",email);
}

public String phoneFirst(SqlSessionTemplate sqlSession, String phone) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.phoneFirst",phone);
}

public String phoneMiddle(SqlSessionTemplate sqlSession, String phone) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.phoneMiddle",phone);
}

public String phoneBack(SqlSessionTemplate sqlSession, String phone) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.phoneBack",phone);
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

public int selectListCount(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberMapper.selectListCount");
}

public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
	// TODO Auto-generated method stub
	
	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectList", userId, rowBounds);
}

public int postInsert(SqlSessionTemplate sqlSession, Postbox p) {
	// TODO Auto-generated method stub
	return sqlSession.insert("memberMapper.postInsert",p);
}

public ArrayList<Postbox> selectListPost(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
	
	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectListPost", userId, rowBounds);
}

public ArrayList<Bid> selectListAttend(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectListAttend", userId, rowBounds);
}

public ArrayList<Bid> selectListBid(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectListBid", userId, rowBounds);
}



}

//public ArrayList<Product> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
//	// TODO Auto-generated method stub
//	
//	int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
//	int limit = pi.getBoardLimit();
//	
//	RowBounds rowBounds = new RowBounds(offset,limit);
//	
//	return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
//}
	
