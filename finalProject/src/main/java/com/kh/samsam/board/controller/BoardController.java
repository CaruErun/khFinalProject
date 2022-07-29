package com.kh.samsam.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.board.model.service.BoardService;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.QnA;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardService service;
	
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
	public String noticeEnrollForm(Model model) {
		
		List<Category> category = service.selectCategoryList();
		
		model.addAttribute("category", category);
		
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
		public String faqEnrollForm(Model model) {

			List<Category> category = service.selectCategoryList();
			
			model.addAttribute("category", category);
			
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
	
//		================================================QnA================================================
		
		// qna 답변 등록
		@RequestMapping("insert.ans")
		public String insertNotice(
									QnA q, 
									HttpSession session,
									Model model) {
			
				int result = boardService.insertQnaAns(q);
				
				if(result>0) {
					session.setAttribute("alertMsg", "QNA답변 등록 성공");
					return "redirect:qnaList.qu";
					
				}else {	// 실패
					model.addAttribute("errorMsg", "QNA답변 등록 실패");
					return "common/errorPage";
				}
			}
		
		////QnA////
		//큐앤에이 목록 조회
		@RequestMapping("qnaList.qu")
		public String selectQnaListView(
										@RequestParam(value="cpage",defaultValue="1") int currentPage,
										Model model
										) {

			int listCount = service.selectListCount();
			
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<QnA> list = service.selectQnaListView(pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
			
			return "board/qnaListView";
			
		}
		
		
		//큐앤에이 작성 폼으로 보내주기 (전달만 해줌~)
		@RequestMapping("insertView.qu")
		public String insertView(Model model) {
			
			List<Category> category = service.selectCategoryList();
			
			model.addAttribute("category", category); //<c:forEach var="c" items="${category }"> 여기 items에 키값(category)가 들어가야함!
			
			return "board/qnaInsert";
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
				
				mv.addObject("q",q).setViewName("board/qnaDetail");

				return mv;
		}
		
		
		//큐앤에이 삭제
		@RequestMapping("delete.qu")
		public ModelAndView deleteQna(ModelAndView mv, int qNo, HttpSession session) {
			
//			System.out.println(qNo); //잘 되는지 체크
			
			
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
			
//			System.out.println(qNo); //잘 되는지 체크
			
			QnA q = service.selectQna(qNo);
			
			mv.addObject("q",q);
			mv.setViewName("board/qnaModi");
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






	
	
