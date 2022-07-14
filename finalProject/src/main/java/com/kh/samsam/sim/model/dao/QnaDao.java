package com.kh.samsam.sim.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Member;
import com.kh.samsam.sim.model.vo.QnA;

@Repository
public class QnaDao {
	
	//전체 QnA 개수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("QnaMapper.selectListCount");
	}


	//QnA 리스트 조회
	public ArrayList<QnA> selectQnaListView(PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit=pi.getBoardLimit();
		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
				
		return (ArrayList)sqlSession.selectList("QnaMapper.selectQnaListView",null,rowBounds);
	}


	//QnA 작성
	public int insertQna(QnA q, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("QnaMapper.insertQna",q);
	}

	//QnA 삭제
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		
		return sqlSession.update("QnaMapper.deleteQna", qnaNo);
	}


	//QnA 상세조회
	public QnA selectQna(int qnaNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("QnaMapper.selectQna",qnaNo);
	}


	//QnA 수정
	public int updateQna(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("QnaMapper.updateQna", q);
	}


	//카테고리 불러오기
	public List<Category> selectCategoryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("QnaMapper.selectCategoryList");
	}
	
}
