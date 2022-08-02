package com.kh.samsam.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.report.model.service.ReportService;
import com.kh.samsam.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private ReportService service;
	
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
		System.out.println(pi);
		System.out.println(listCount);
		System.out.println(list);
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
	

	

	@RequestMapping("report.mem")
	public String reportMember(Report r, HttpSession session, Model model, HttpServletRequest request) {
			System.out.println(r);
			if(((Member)session.getAttribute("loginUser"))==null) {
				session.setAttribute("alertMsg", "로그인 후 이용해주세요");
					    return "redirect:" + request.getHeader("Referer");
			}else {
				
			
				if(r.getReportCateNo().equals("")) {
					session.setAttribute("alertMsg", "사유를 선택해주세요.");
					return "redirect:" + request.getHeader("Referer");
				}else {
				
			
					int result = service.reportMember(r);
					
					if(result>0) { //성공
				
					model.addAttribute("r",r);
					session.setAttribute("alertMsg", "회원 신고가 완료되었습니다.");
					return "report/report_done";
				
					}else { //실패
						model.addAttribute("errorMsg","신고에 실패하였습니다.");
						return "common/errorPage";
					}
				}
			}
		}
	
	
	//신고완료
	@RequestMapping("reportDoneView.mem")
	public String reportDoneView() {
		return "report/report_done";
	}
	
	

	
	

}
