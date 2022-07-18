package com.kh.samsam.report.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.report.model.vo.Report;

@Repository
public class ReportDao {

	

	//신고하기
	public int reportMember(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("reportMapper.reportMember",r);
	}

	
	




}
