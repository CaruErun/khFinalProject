package com.kh.samsam.sim.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Report;

@Repository
public class SimDao {

	

	//신고하기

	public int reportMember(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("simMapper.reportMember",r);
	}

	
	
	
//	//찜하기(관심목록)
//	public void pickList(SqlSessionTemplate sqlSession) {
//		
//	}
//	
//	
//	
//	// 게시글 추천여부 검사
//	public int recCheck(Map<String, Object> m, SqlSessionTemplate sqlSession){
//		int result = 0;
//		try {
//			result = (Integer) sqlSession.selectOne("simMapper.rec_check", m);
//		} catch (Exception e) {
//			System.out.println("recCheck : " + e);
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	
//	
//	// 게시글 추천
//	public void recUpdate(Map<String, Object> m, SqlSessionTemplate sqlSession){
//		try {
//			sqlSession.insert("simMapper.rec_update", m);
//		} catch (Exception e) {
//			System.out.println("recUpdate : " + e);
//			e.printStackTrace();
//		}
//	}
//	
//	
//	// 게시글 추천 제거
//	public void recDelete(Map<String, Object> m, SqlSessionTemplate sqlSession){
//		try {
//			sqlSession.insert("simMapper.rec_delete", m);
//		} catch (Exception e) {
//			System.out.println("recDelete : " + e);
//			e.printStackTrace();
//		}
//	
//	}






}
