package com.kh.samsam.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.QnA;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;

public interface BoardService {

	// ============ 공지사항 ============
	int selectNoticeListCount();

	ArrayList<NoticeFaq> selectNoticeList(PageInfo pi);

	int increaseNoticeCount(int nfNo);

	NoticeFaq selectNotice(int nfNo);

	int updateNotice(NoticeFaq n);

	int insertNotice(NoticeFaq n);

	int deleteNotice(int nfNo);

	// ============ FAQ ============
	int selectFaqListCount();

	ArrayList<NoticeFaq> selectFaqList(PageInfo pi);

	int increaseFaqCount(int nfNo);

	NoticeFaq selectFaq(int nfNo);

	int updateFaq(NoticeFaq f);

	int insertFaq(NoticeFaq f);

	int deleteFaq(int nfNo);


	// ============ QNA ============
//	int selectQnaListCount();
//
//	ArrayList<QnA> selectQnaList(PageInfo pi);

	//
	QnA selectQnaa(int qno);

	int insertQnaAns(QnA q);

	
	
	
////QnA////
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
	
	
	//2022.07.25 상품문의 시작
	
	ArrayList<QnA> ajaxInquiry(int proNo, PageInfo pi);
	int selectInquiry(int proNo);
	void insertConQna(QnA q);
	//2022.07.25 상품문의 끝 
}








