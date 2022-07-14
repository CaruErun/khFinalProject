package com.kh.samsam.sim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.samsam.sim.model.service.SimService;
import com.kh.samsam.sim.model.vo.Category;
import com.kh.samsam.sim.model.vo.Report;

@Controller
public class SimController {

	@Autowired
	private SimService service;
	
	
	
	
	
	
	//신고하기 form으로 전달하기
	@RequestMapping("reportView.mem")
	public String reportView(Model model) {
		
		return "sim/report";
	}
	
	
	//신고하기
	@RequestMapping("report.mem")
	public String reportMember(Report r, HttpSession session, Model model) {
			
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
	
	
	
	
	
	
	
//	// 상품 상세페이지
//	@GetMapping("/prdct/{prdct_id}")
//	public ModelAndView productDetail(@PathVariable("prdct_id") String p_id, @AuthenticationPrincipal MemberDetails memberDetails,
//	            PrdReviewCriteria rcri, PrdQnACriteria qacri, PrdctLikeVO prdctLikeVO, ModelAndView mav) throws Exception {
//
//
//	    // 해당 상품 찜 여부 확인용 데이터 가져오기
//	    log.info("prdLike...");
//	    mav.addObject("prdLikeVal", service.getPrdLikeVal(p_id));
//
//	    return mav;
//	}
//
//	// 상품 상세페이지 찜하기 기능
//	@Transactional(rollbackFor = Exception.class)
//	@PostMapping("/prdct/{prdct_id}")
//	public ResponseEntity<String> prdctLike(@RequestBody PrdctLikeVO prdctLikeVO) {
//	    ResponseEntity<String> entity = null;
//
//	    log.info("prdctLike...");
//	    try {
//	    	service.setPrdctLike(prdctLikeVO);
//	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//	    }
//
//	    return entity;
//	}
//
//	// 상품 상세페이지 찜취소 기능
//	@Transactional(rollbackFor = Exception.class)
//	@DeleteMapping("/prdct/{prdct_id}")
//	public ResponseEntity<String> prdctLikeCancel(PrdctLikeVO prdctLikeVO) {
//	    ResponseEntity<String> entity = null;
//
//	    log.info("prdctLikeCancel...");
//	    try {
//	    	service.prdctLikeCancel(prdctLikeVO);
//	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//	    }
//
//	    return entity;
//	}
//		
		
}
