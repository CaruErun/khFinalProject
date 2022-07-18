package com.kh.samsam.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.board.model.dao.BoardDao;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.board.model.vo.QnA;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	

	////QnA////
	//QnA 리스트 조회 + 페이징 처리
	//전체 QnA 개수 구하기
	@Override
	public int selectListCount() {
		
		return dao.selectListCount(sqlSession);
	}

	//QnA 리스트 조회
	@Override
	public ArrayList<QnA> selectQnaListView(PageInfo pi) {
		
		return dao.selectQnaListView(pi, sqlSession);
	}

	//QnA 작성하기
	@Override
	public int insertQna(QnA q) {
		return dao.insertQna(q,sqlSession);
	}

	//QnA 상세조회
	@Override
	public QnA selectQna(int qnaNo) {
		return dao.selectQna(qnaNo, sqlSession);
	}

	//QnA 삭제(DML구문이라서 int형 반환)
	@Override
	public int deleteQna(int qnaNo) {
		return dao.deleteQna(sqlSession, qnaNo);
	}

	//QnA 수정
	@Override
	public int updateQna(QnA q) {
		return dao.updateQna(sqlSession, q);
	}


	//카테고리 불러오기
	@Override
	public List<Category> selectCategoryList() {
		
		return dao.selectCategoryList(sqlSession);
	}
	
	
	



}
