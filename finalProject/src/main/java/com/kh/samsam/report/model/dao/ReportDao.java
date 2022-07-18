package com.kh.samsam.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.report.model.vo.Report;

@Repository
public class ReportDao {

	public int selectReportListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reportMapper.selectReportListCount");
	}

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList", null, rowBounds);
	}

	public Report selectReportContent(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.selectOne("reportMapper.selectReportContent", reportNo);
	}

	//신고하기
	public int reportMember(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("reportMapper.reportMember",r);
	}

}
