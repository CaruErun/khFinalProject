package com.kh.samsam.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.report.model.dao.ReportDao;
import com.kh.samsam.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao reportDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectReportListCount() {
		int listCount = reportDao.selectReportListCount(sqlSession);
		return listCount;
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		ArrayList<Report> list = reportDao.selectReportList(sqlSession, pi);
		return list;
	}

	@Override
	public Report selectReportContent(int reportNo) {
		 Report r = reportDao.selectReportContent(sqlSession, reportNo);
		 return r;
	}

}
