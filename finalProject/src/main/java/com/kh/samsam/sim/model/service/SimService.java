package com.kh.samsam.sim.model.service;

import java.util.List;

import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Report;

public interface SimService {

	//신고하기
	int reportMember(Report r);
	
	
	//찜하기(관심목록)
//	void pickList();
	
}
