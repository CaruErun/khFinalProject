package com.kh.samsam.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.QnA;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;

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
//	public int selectQnaListCount(SqlSessionTemplate sqlSession) {
//		
//		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
//	}
//
//	public ArrayList<QnA> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
//
//		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
//		int limit = pi.getBoardLimit();
//		
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
//	}

	public static QnA selectQnaa(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("boardMapper.selectQna", qno);
	}

	public int insertQnaAns(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("boardMapper.insertQnaAns", q);
	}
	
	
	
	
	
	////QnA////
	//전체 QnA 개수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount");
	}


	//QnA 리스트 조회
	public ArrayList<QnA> selectQnaListView(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit=pi.getBoardLimit();
		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
				
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnaListView",null,rowBounds);
	}


	//QnA 작성
	public int insertQna(QnA q, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertQna",q);
	}

	//QnA 삭제
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.update("boardMapper.deleteQna", qnaNo);
	}


	//QnA 상세조회
	public QnA selectQna(int qnaNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectQna",qnaNo);
	}


	//QnA 수정
	public int updateQna(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("boardMapper.updateQna", q);
	}


	//카테고리 불러오기
	public List<Category> selectCategoryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("commonMapper.selectCategoryList");
	}

//MyPage
	//게시글 전체 개수
	public int selectListMyPageCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListMyPageCount");
	}

	//리스트 조회
	public ArrayList<QnA> selectQnaListMyPageView(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit=pi.getBoardLimit();
		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
				
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnaListMyPageView",userId,rowBounds);
	}
}













