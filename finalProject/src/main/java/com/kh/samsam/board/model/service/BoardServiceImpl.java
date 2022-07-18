package com.kh.samsam.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.board.model.dao.BoardDao;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.Qna;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
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
	@Override
	public int selectQnaListCount() {
		int listCount = boardDao.selectQnaListCount(sqlSession);
		return listCount;
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		ArrayList<Qna> list = boardDao.selectQnaList(sqlSession, pi);
		return list;
	}

	@Override
	public Qna selectQna(int qno) {
		Qna q = boardDao.selectQna(sqlSession, qno);
		return q;
	}

	@Override
	public int insertQnaAns(Qna q) {
		return boardDao.insertQnaAns(sqlSession, q);
	}
	
}












