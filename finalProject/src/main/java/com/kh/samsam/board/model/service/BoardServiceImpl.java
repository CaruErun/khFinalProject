package com.kh.samsam.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.board.model.dao.BoardDao;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.QnA;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// ============ 공지사항 ============
	@Override
	public int selectNoticeListCount() {
		int listCount = boardDao.selectNoticeListCount(sqlSession);
		return listCount;
	}

	@Override
	public ArrayList<NoticeFaq> selectNoticeList(PageInfo pi) {
		ArrayList<NoticeFaq> list = boardDao.selectNoticeList(sqlSession, pi);
		return list;
	}

	@Override
	public int increaseNoticeCount(int nfNo) {
		int result = boardDao.increaseNoticeCount(sqlSession, nfNo);
		return result;
	}

	@Override
	public NoticeFaq selectNotice(int nfNo) {
		NoticeFaq n = boardDao.selectNotice(sqlSession, nfNo);
		return n;
	}

	@Override
	public int updateNotice(NoticeFaq n) {		
		int result = boardDao.updateNotice(sqlSession, n);
		return result;
	}

	@Override
	public int insertNotice(NoticeFaq n) {
		return boardDao.insertNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int nfNo) {
		return boardDao.deleteNotice(sqlSession, nfNo);
	}

//	============ FAQ ============
	@Override
	public int selectFaqListCount() {
		int listCount = boardDao.selectFaqListCount(sqlSession);
		return listCount;
	}

	@Override
	public ArrayList<NoticeFaq> selectFaqList(PageInfo pi) {
		ArrayList<NoticeFaq> list = boardDao.selectFaqList(sqlSession, pi);
		return list;
	}

	@Override
	public int increaseFaqCount(int nfNo) {
		int result = boardDao.increaseFaqCount(sqlSession, nfNo);
		return result;
	}

	@Override
	public NoticeFaq selectFaq(int nfNo) {
		NoticeFaq n = boardDao.selectFaq(sqlSession, nfNo);
		return n;
	}

	@Override
	public int updateFaq(NoticeFaq f) {
		int result = boardDao.updateFaq(sqlSession, f);
		return result;
	}

	@Override
	public int insertFaq(NoticeFaq f) {
		return boardDao.insertFaq(sqlSession, f);
	}

	@Override
	public int deleteFaq(int nfNo) {
		return boardDao.deleteFaq(sqlSession, nfNo);
	}
	

//	============ QNA ============
//	@Override
//	public int selectQnaListCount() {
//		int listCount = boardDao.selectQnaListCount(sqlSession);
//		return listCount;
//	}
//
//	@Override
//	public ArrayList<QnA> selectQnaList(PageInfo pi) {
//		ArrayList<QnA> list = boardDao.selectQnaList(sqlSession, pi);
//		return list;
//	}

	@Override
	public QnA selectQnaa(int qno) {
		QnA q = boardDao.selectQnaa(sqlSession, qno);
		return q;
	}

	@Override
	public int insertQnaAns(QnA q) {
		return boardDao.insertQnaAns(sqlSession, q);
	}
	
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


	//2022.07.25 상품문의 시작
	@Override
	public ArrayList<QnA> ajaxInquiry(int proNo, PageInfo pi) {
		
		return boardDao.ajaxInquiry(sqlSession,proNo, pi);
	}
	
	@Override
	public int selectInquiry(int proNo) {
		return boardDao.selectInquiry(sqlSession, proNo);
	}
	@Override
	public void insertConQna(QnA q) {
		boardDao.insertConQna(sqlSession, q);
	}
	//2022.07.25 상품문의 끝 




	
	



}
