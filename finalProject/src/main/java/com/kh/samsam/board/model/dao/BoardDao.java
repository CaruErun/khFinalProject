package com.kh.samsam.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.Qna;

@Repository
public class BoardDao {

	// ============ 공지사항 ============
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("boardMapper.selectNoticeListCount");
	}

	public ArrayList<NoticeFaq> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null, rowBounds);
	}

	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.update("boardMapper.increaseNoticeFaqCount", nfNo);
	}

	public NoticeFaq selectNotice(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.selectOne("boardMapper.selectNoticeFaq", nfNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, NoticeFaq n) {
		
		return sqlSession.update("boardMapper.updateNoticeFaq", n);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, NoticeFaq n) {
		
		return sqlSession.insert("boardMapper.insertNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.update("boardMapper.deleteNoticeFaq", nfNo);
	}

//	============ FAQ ============
	public int selectFaqListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("boardMapper.selectFaqListCount");
	}

	public ArrayList<NoticeFaq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqList", null, rowBounds);
	}

	public int increaseFaqCount(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.update("boardMapper.increaseNoticeFaqCount", nfNo);
	}

	public NoticeFaq selectFaq(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.selectOne("boardMapper.selectNoticeFaq", nfNo);
	}

	public int updateFaq(SqlSessionTemplate sqlSession, NoticeFaq f) {
		
		return sqlSession.update("boardMapper.updateNoticeFaq", f);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, NoticeFaq f) {
		
		return sqlSession.insert("boardMapper.insertFaq", f);
	}

	public int deleteFaq(SqlSessionTemplate sqlSession, int nfNo) {
		
		return sqlSession.update("boardMapper.deleteNoticeFaq", nfNo);
	}

//	============ QNA ============
	public int selectQnaListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}

	public static Qna selectQna(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("qnaMapper.selectQna", qno);
	}

	public int insertQnaAns(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("qnaMapper.insertQnaAns", q);
	}

}










