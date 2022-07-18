package com.kh.samsam.report.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;
import com.kh.samsam.report.model.service.ReportService;
import com.kh.samsam.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	// 신고 목록 조회
	@RequestMapping("reportList.re")
	public String selectReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									Model model
									) {
		int listCount = reportService.selectReportListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Report> list = reportService.selectReportList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "report/reportListView";
	}
	
//	@RequestMapping("detailAjax.re")
//	public String selectReportContent(int reportNo, ModelAndView mv){
//		
//		Report r = reportService.selectReportContent(reportNo);
//		
//		
//		return "report/reportListView";
//	}

	// 신고 내용 상세 보기
	@ResponseBody
	@RequestMapping(value="detailAjax.re", produces="application/json; charser=UFT-8")
	public String selectReportContent(int reportNo) {
		Report r = reportService.selectReportContent(reportNo);
		return new Gson().toJson(r);
	}
	

}
