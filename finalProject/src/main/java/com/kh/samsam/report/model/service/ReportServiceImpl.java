package com.kh.samsam.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.report.model.dao.ReportDao;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{

	
	@Autowired
	private ReportDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	//신고하기
	@Override
	public int reportMember(Report r) {
		
		return dao.reportMember(sqlSession, r);
	}



	
	
	
}
