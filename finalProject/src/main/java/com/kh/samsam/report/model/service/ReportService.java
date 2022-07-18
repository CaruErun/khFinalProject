package com.kh.samsam.report.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.report.model.vo.Report;

public interface ReportService {

	int selectReportListCount();

	ArrayList<Report> selectReportList(PageInfo pi);

	Report selectReportContent(int reportNo);

}
