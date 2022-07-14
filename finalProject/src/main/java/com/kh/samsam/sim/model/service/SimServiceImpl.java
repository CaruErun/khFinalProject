package com.kh.samsam.sim.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.sim.model.dao.SimDao;
import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Report;

@Service
public class SimServiceImpl implements SimService{

	
	@Autowired
	private SimDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	//신고하기
	@Override
	public int reportMember(Report r) {
		
		return dao.reportMember(sqlSession, r);
	}




//	@Override
//	public List<Category> selectrRCategoryList() {
//		return dao.selectrRCategoryList(sqlSession);
//	}




//	@Override
//	public void pickList() {
//	}
//	//찜하기(관심목록)
//	@Override
//	public void pickList() {
//
//		// no와 id값을 map에 저장
//		Map<String, Object> m = new HashMap<>();
//		m.put("no", request.getParameter("no"));
//		m.put("id", request.getParameter("id"));
//		
//		Simdao manager = dao.getInstance();
//		// 동일 게시글에 대한 이전 추천 여부 검색
//		int result = manager.recCheck(m);
//		
//		if(result == 0){ // 추천하지 않았다면 추천 추가
//			manager.recUpdate(m);
//		}else{ // 추천을 하였다면 추천 삭제
//			manager.recDelete(m);
//		}
//		
//		return null;
//	}


	
	
	
}
