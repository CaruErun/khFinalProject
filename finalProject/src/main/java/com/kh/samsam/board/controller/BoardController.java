package com.kh.samsam.board.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;
import com.kh.samsam.board.model.service.BoardService;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.Qna;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 공지사항 목록 조회
	@RequestMapping("noticeList.no")
	public String selectNoticeList(
									@RequestParam(value="cpage", defaultValue="1") int currentPage,
									Model model) {
		
		int listCount = boardService.selectNoticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<NoticeFaq> list = boardService.selectNoticeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/noticeListView";
	}
	
	// 공지사항 상세 보기
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		int nfNo = nno;
		int result = boardService.increaseNoticeCount(nfNo);
		
		if(result>0) {
			NoticeFaq n = boardService.selectNotice(nfNo);
			n.setNfContent(n.getNfContent().replaceAll("\n", "<br>"));
			mv.addObject("n", n);
			mv.setViewName("board/noticeDetailView");
			
		}else {
			mv.addObject("errorMsg", "공지사항 조회 실패 ㅋ");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 수정 폼
	@RequestMapping("updateForm.no")
	public ModelAndView updateNotice(ModelAndView mv, int nfNo, String filePath) {
		
		NoticeFaq n = boardService.selectNotice(nfNo);
		
		mv.addObject("n", n);
		mv.setViewName("board/noticeUpdateForm");
		
		return mv;
	}
	
	// 공지사항 수정
	@RequestMapping("update.no")
	public ModelAndView updateNotice(ModelAndView mv, NoticeFaq n, HttpSession session) {
		//												ㄴ 원래 있던거
		int result = boardService.updateNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항 수정 성공");
			mv.setViewName("redirect:detail.no?nno="+n.getNfNo());
		}else {
			mv.addObject("errorMsg", "공지사항 수정 실패 ㅋ");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 등록 폼
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm() {
		
		return "board/noticeEnrollForm";
	}
	
	// 공지사항 등록
	@RequestMapping("insert.no")
	public String insertNotice(
								NoticeFaq n, 
								HttpSession session,
								Model model) {
		
			int result = boardService.insertNotice(n);
			
			if(result>0) {
				session.setAttribute("alertMsg", "공지사항 등록 성공");
				return "redirect:noticeList.no";
				
			}else {	// 실패
				model.addAttribute("errorMsg", "공지사항 등록 실패");
				return "common/errorPage";
			}
		}
	
	// 공지사항 삭제
	@RequestMapping("delete.no")
	public ModelAndView deleteNotice(ModelAndView mv, int nfNo, HttpSession session) {
		
		int result = boardService.deleteNotice(nfNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항 삭제 성공");
			mv.setViewName("redirect:noticeList.no");
			
		}else {
			mv.addObject("errorMsg", "공지사항 삭제 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
//	================================================faq================================================
	// FAQ 목록 조회
		@RequestMapping("faqList.fq")
		public String selectFaqList(
										@RequestParam(value="cpage", defaultValue="1") int currentPage,
										Model model) {
			
			int listCount = boardService.selectFaqListCount();
			
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			ArrayList<NoticeFaq> list = boardService.selectFaqList(pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "board/faqListView";
		}
		
		// FAQ 상세 보기
		@RequestMapping("detail.fq")
		public ModelAndView selectFaq(int fno, ModelAndView mv) {
			
			int nfNo = fno;
			int result = boardService.increaseFaqCount(nfNo);
			
			if(result>0) {
				NoticeFaq f = boardService.selectFaq(nfNo);
				
				mv.addObject("f", f);
				mv.setViewName("board/faqDetailView");
				
			}else {
				mv.addObject("errorMsg", "FAQ 조회 실패 ㅋ");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		// FAQ 수정 폼
		@RequestMapping("updateForm.fq")
		public ModelAndView updateFaq(ModelAndView mv, int nfNo, String filePath) {
			
			NoticeFaq f = boardService.selectFaq(nfNo);
			
			mv.addObject("f", f);
			mv.setViewName("board/faqUpdateForm");
			
			return mv;
		}
		
		// FAQ 수정
		@RequestMapping("update.fq")
		public ModelAndView updateFaq(ModelAndView mv, NoticeFaq f, HttpSession session) {
			//												ㄴ 원래 있던거
			int result = boardService.updateFaq(f);
			
			if(result>0) {
				session.setAttribute("alertMsg", "FAQ 수정 성공");
				mv.setViewName("redirect:faqList.fq");
			}else {
				mv.addObject("errorMsg", "FAQ 수정 실패 ㅋ");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		// FAQ 등록 폼
		@RequestMapping("enrollForm.fq")
		public String faqEnrollForm() {
			
			return "board/faqEnrollForm";
		}
		
		// FAQ 등록
		@RequestMapping("insert.fq")
		public String insertBoard(
									NoticeFaq f, 
									HttpSession session,
									Model model) {
			
				int result = boardService.insertFaq(f);
				
				if(result>0) {
					session.setAttribute("alertMsg", "FAQ 등록 성공");
					return "redirect:faqList.fq";
					
				}else {	// 실패
					model.addAttribute("errorMsg", "FAQ 등록 실패");
					return "common/errorPage";
				}
			}
		
		// FAQ 삭제
		@RequestMapping("delete.fq")
		public ModelAndView deleteBoard(ModelAndView mv, int nfNo, HttpSession session) {
			
			int result = boardService.deleteFaq(nfNo);
			
			if(result>0) {
				session.setAttribute("alertMsg", "FAQ 삭제 성공");
				mv.setViewName("redirect:faqList.fq");
				
			}else {
				mv.addObject("errorMsg", "FAQ 삭제 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
		//=============================================================
		// qna 목록 조회
		@RequestMapping("qnaList.qa")
		public String selectQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
			
			int listCount = boardService.selectQnaListCount();
			
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			ArrayList<Qna> list = boardService.selectQnaList(pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "qna/qnaListView";
		}
		
		// qna 상세 보기
		@RequestMapping("detail.qa")
		public ModelAndView selectQna(int qno, ModelAndView mv) {
			
			Qna q = boardService.selectQna(qno);
				
			mv.addObject("q", q);
			mv.setViewName("qna/qnaDetailView");
			return mv;
		}
		
		// qna 등록
		@RequestMapping("insert.ans")
		public String insertNotice(
									Qna q, 
									HttpSession session,
									Model model) {
			
				int result = boardService.insertQnaAns(q);
				
				if(result>0) {
					session.setAttribute("alertMsg", "QNA답변 등록 성공");
					return "redirect:qnaList.qa";
					
				}else {	// 실패
					model.addAttribute("errorMsg", "QNA답변 등록 실패");
					return "common/errorPage";
				}
			}
	
	
}
