package com.kh.samsam.board.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;
import com.kh.samsam.board.model.service.BoardService;
import com.kh.samsam.common.model.service.CommonService;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.board.model.vo.QnA;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	
	
	////QnA////
	//큐앤에이 목록 조회
	@RequestMapping("qnaList.qu")
	public String selectQnaListView(
									@RequestParam(value="cpage",defaultValue="1") int currentPage,
									Model model
									) {

		int listCount = service.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<QnA> list = service.selectQnaListView(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "sim/qnaListView";
		
	}
	
	
	//큐앤에이 작성 폼으로 보내주기 (전달만 해줌~)
	@RequestMapping("insertView.qu")
	public String insertView(Model model) {
		
		List<Category> category = service.selectCategoryList();
		
		model.addAttribute("category", category); //<c:forEach var="c" items="${category }"> 여기 items에 키값(category)가 들어가야함!
		
		return "sim/qnaInsert";
	}
	
	
	//큐앤에이 작성
	@RequestMapping("insert.qu")
	public String insertBoard(QnA q, HttpSession session, Model model) {
		
		
		int result = service.insertQna(q);
		
		if(result>0) { //성공
			
			session.setAttribute("alertMsg", "게시글 작성을 성공하였습니다.");
			return "redirect:qnaList.qu";
			
		}else { //실패
			model.addAttribute("errorMsg","게시글 작성에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	
	//큐앤에이 상세 보기
	@RequestMapping("detail.qu")
	public ModelAndView selectQna(int qNo, ModelAndView mv) {
			//상세보기할 정보를 select로 조회 해오기
			QnA q = service.selectQna(qNo);
			
			mv.addObject("q",q).setViewName("sim/qnaDetail");

			return mv;
	}
	
	
	//큐앤에이 삭제
	@RequestMapping("delete.qu")
	public ModelAndView deleteQna(ModelAndView mv, int qNo, HttpSession session) {
		
//		System.out.println(qNo); //잘 되는지 체크
		
		
		int result = service.deleteQna(qNo);
		
		if(result>0) { //게시글 삭제 성공
			session.setAttribute("alertMsg", "게시글 삭제를 성공하였습니다.");
			mv.setViewName("redirect:qnaList.qu");
			
		}else { //게시글 삭제 실패
			mv.addObject("errorMsg","게시글 작성에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	
	//큐앤에이 수정 폼으로 정보 보내기
	@RequestMapping("qnaModiView.qu")
	public ModelAndView updateForm(ModelAndView mv,@RequestParam(value="qNo", defaultValue="123123") int qNo) { //public ModelAndView , public String 본인이 하고싶은거로 해~
		//수정하기 전에 게시글 정보 담아서 수정하기 페이지로 포워딩하기
		
//		System.out.println(qNo); //잘 되는지 체크
		
	
		QnA q = service.selectQna(qNo);
		
		mv.addObject("q",q);
		mv.setViewName("sim/qnaModi");
		return mv;
	}
	
	
	//큐앤에이 수정
	@RequestMapping("qnaModi.qu")
	public ModelAndView updateBoard(ModelAndView mv, QnA q, MultipartFile upfile, HttpSession session) {
		int result = service.updateQna(q);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:detail.qu?qNo=" + q.getQnaNo());
			
		}else {
			
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	


	
	

}
	

