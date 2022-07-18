package com.kh.samsam.report.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.samsam.report.model.service.ReportService;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportService service;
	
	
	
	//report
	//신고하기 form으로 전달하기
	@RequestMapping("reportView.mem")
	public String reportView(Model model) {
		
		return "sim/report";
	}
	
	
	//신고하기
	@RequestMapping("report.mem")
	public String reportMember(Report r, HttpSession session, Model model) {
			System.out.println("hh");
			int result = service.reportMember(r);
			
			if(result>0) { //성공
				
				model.addAttribute("r",r);
				session.setAttribute("alertMsg", "회원 신고가 완료되었습니다.");
				return "sim/report_done";
				
			}else { //실패
				model.addAttribute("errorMsg","신고에 실패하였습니다.");
				return "common/errorPage";
			}
		}
	
	
	//신고완료
	@RequestMapping("reportDoneView.mem")
	public String reportDoneView() {
		return "sim/report_done";
	}

	
	
	
	
	

}
