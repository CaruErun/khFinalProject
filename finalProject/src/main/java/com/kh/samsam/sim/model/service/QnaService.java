package com.kh.samsam.sim.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Member;
import com.kh.samsam.sim.model.vo.QnA;

public interface QnaService {


	//큐앤에이 리스트 조회 + 페이징 처리
	//전체 게시글 개수 구하기
	int selectListCount();
	
	//큐앤에이 리스트 조회
	ArrayList<QnA> selectQnaListView(PageInfo pi); //common-model-no-pageInfo.java
	
	//큐앤에이 작성하기
	int insertQna(QnA q);
		
	//큐앤에이 상세조회
	public abstract QnA selectQna(int qnaNo); //다른 구문들은 public abstract이 생략된 형태
	
	//큐앤에이 삭제(DML구문이라서 int형 반환)
	public abstract int deleteQna(int qnaNo);
	
	//큐앤에이 수정
	int updateQna(QnA q);

	//카테고리 불러오기
	public List<Category> selectCategoryList();
	
}
