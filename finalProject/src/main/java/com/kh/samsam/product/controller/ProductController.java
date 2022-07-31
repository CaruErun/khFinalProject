package com.kh.samsam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.common.template.Pagination;
import com.kh.samsam.member.model.vo.ProLike;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.product.model.service.ProductService;
import com.kh.samsam.product.model.vo.Bid;
import com.kh.samsam.product.model.vo.Postbox;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductChart;
import com.kh.samsam.product.model.vo.ProductImages;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// 차트 신규 등록, 거래 개수
	@RequestMapping("product.ct")
	public ModelAndView productEnrollAmount(ModelAndView mv) {

		ProductChart[] paeArr = new ProductChart[12];		
		paeArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		paeArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		paeArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		paeArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		paeArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		paeArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		paeArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		paeArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		paeArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		paeArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		paeArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		paeArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counteArr = new int[12];	
		for(int i=0; i<counteArr.length; i++) {
			counteArr[i] = productService.productEnrollAmount(paeArr[i]);
		}
		double emost = 0;
		for(int i=0; i<counteArr.length; i++) {
			if(counteArr[i]>emost){
				emost=counteArr[i];
			}
		}
		emost = emost*1.1;
		
		ProductChart ctEnrollAmount = new ProductChart(counteArr, emost);	
		
		// ---------------------------------------------------------------
		
		ProductChart[] patArr = new ProductChart[12];
		patArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		patArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		patArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		patArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		patArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		patArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		patArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		patArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		patArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		patArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		patArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		patArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counttArr = new int[12];
		for(int i=0; i<counttArr.length; i++) {
			counttArr[i] = productService.productTradeAmount(patArr[i]);
		}
		double tmost = 0;
		for(int i=0; i<counttArr.length; i++) {
			if(counttArr[i]>tmost){
				tmost=counttArr[i];
			}
		}
		tmost = tmost*1.1;
		
		ProductChart ctTradeAmount = new ProductChart(counttArr, tmost);
		
		mv.addObject("ctEnrollAmount", ctEnrollAmount);
		mv.addObject("ctTradeAmount", ctTradeAmount);
		mv.setViewName("product/chartProductAmount");
		
		return mv;
	}
	
	// 차트 신규 등록 금액
	@RequestMapping("money.ct")
	public ModelAndView productEnrollMoney(ModelAndView mv) {
		
		ProductChart[] pmeArr = new ProductChart[12];
		pmeArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		pmeArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		pmeArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		pmeArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		pmeArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		pmeArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		pmeArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		pmeArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		pmeArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		pmeArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		pmeArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		pmeArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counteArr = new int[12];
		
		for(int i=0; i<counteArr.length; i++) {
			counteArr[i] = productService.productEnrollMoney(pmeArr[i]);
		}
		
		double emost = 0;
		for(int i=0; i<counteArr.length; i++) {
			if(counteArr[i]>emost){
				emost=counteArr[i];
			}
		}
		emost = emost*1.1;
		
		ProductChart ctEnrollMoney = new ProductChart(counteArr, emost);
		
		//---------------------------------------------------------------
		
		ProductChart[] pmtArr = new ProductChart[12];
		pmtArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		pmtArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		pmtArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		pmtArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		pmtArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		pmtArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		pmtArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		pmtArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		pmtArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		pmtArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		pmtArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		pmtArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counttArr = new int[12];
		
		for(int i=0; i<counttArr.length; i++) {
			counttArr[i] = productService.productTradeMoney(pmtArr[i]);
		}
		
		double tmost = 0;
		for(int i=0; i<counttArr.length; i++) {
			if(counttArr[i]>tmost){
				tmost=counttArr[i];
			}
		}
		tmost = tmost*1.1;
		
		ProductChart ctTradeMoney = new ProductChart(counttArr, tmost);
		
		mv.addObject("ctEnrollMoney", ctEnrollMoney);
		mv.addObject("ctTradeMoney", ctTradeMoney);
		mv.setViewName("product/chartProductMoney");
		
		return mv;
	}
	@RequestMapping("insertProductForm.pr")
	public String insertProductForm() {
		return "product/insertProductForm";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCateList.pr", produces="json/application; charset=UTF-8")
	public String selectCategoryList(int categoryNo){
		ArrayList<Category> cateList = productService.selectCategoryList(categoryNo);
		return new Gson().toJson(cateList);
		
	}
	@RequestMapping("insertProduct.pr")
	public ModelAndView insertProduct(Product p
								,MultipartFile[] upfile
								,HttpSession session
								,ModelAndView mv) {
		
		System.out.println(p);
	
		ArrayList<ProductImages> list = new ArrayList<>();
		
			
			for(int i=0; i<upfile.length; i++) {
				ProductImages pi = new ProductImages();
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					pi.setOriName(upfile[i].getOriginalFilename());
					String changeName = saveFile(upfile[i],session);
					pi.setSysName(changeName);
					pi.setPath("resources/uploadFiles/"+changeName);
					list.add(pi);
				}
			}
		
	
		
		int result =productService.insertProduct(p);
		if(result>0) {
			int result1 =productService.insertProductImages(list);
			int proNo= productService.selectProNo(p.getSellId());
			System.out.println(proNo);
			if(result1>0) {
				session.setAttribute("alertMsg", "상품등록 성공");
				mv.setViewName("redirect:productDetail.pr?pNo="+proNo);
			}else {
				mv.addObject("errorMsg", "상품등록 실패");
				mv.setViewName("common/errorPage");
			}
		}else {
			mv.addObject("errorMsg", "상품등록 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping("productList.pr")
	public String selectList(
						@RequestParam(value="cPage", defaultValue="1") int currentPage,
						Model model
					) {
		
		int listCount = productService.selectProListCount();
		
		int pageLimit =10;
		int boardLimit = 20;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> plist = productService.selectProductList(pi);
		model.addAttribute("plist",plist);
		model.addAttribute("pi",pi);
		return "product/productListView";
	}
	
	
	@RequestMapping("productDetail.pr")
	public String selectProduct(int pNo

								,Model model, HttpSession session) {
	

		
		String userId="";
		if(((Member)session.getAttribute("loginUser")) != null) {
			userId = ((Member)session.getAttribute("loginUser")).getUserId();
		}
		
		int result=productService.increaseCount(pNo);
		if(result > 0) {
			Product p =productService.selectProduct(pNo);
			p.setProContent(p.getProContent().replaceAll("\n", "<br>"));
			ArrayList<ProductImages> piList = productService.selectImgList(pNo);
			model.addAttribute("p",p);
			model.addAttribute("piList",piList);
			

			if(userId != "") {
			int proL = productService.prolike(pNo, userId);
			model.addAttribute("proL",proL);
			}
			

			return "product/productDetail";
			
		}else {
			model.addAttribute("errorMsg", "상품조회 실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("insertBid.pr")
	public String insertBid(Bid b, HttpSession session, Model model) {
		System.out.println(b);
		
		int result=productService.insertBid(b);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 입찰하셨습니다.");
			return "redirect:/productDetail.pr?pNo="+b.getProNo();
			
		}else {//실패
			model.addAttribute("errorMsg","입찰 실패");
			return "common/errorPage";
		}
	}
	@ResponseBody
	@RequestMapping(value="selectBidPrice.pr", produces="json/application; charset=UTF-8")
	public String selectBidPrice(int proNo) {
		
		int bidPrice = productService.selectBidPrice(proNo);
		return new Gson().toJson(bidPrice);
		
	}
	@ResponseBody
	@RequestMapping(value="buyImmediately.pr", produces="json/application; charset=UTF-8")
	public String buyImmediately(int proNo
								,HttpSession session
								,Model model) {
		System.out.println(proNo);
		int result = productService.buyImeddiately(proNo);
		
		return new Gson().toJson(result);
		
	}
	@RequestMapping("deleteProduct.pr")
	public ModelAndView deleteProduct(int proNo
								,HttpSession session
								,ModelAndView mv) {
		
		int result = productService.deleteProduct(proNo);
		if(result>0) {
			int result2= productService.deleteProImg(proNo);
			if(result2>0) {
				session.setAttribute("alertMsg", "상품삭제 성공");
				mv.setViewName("redirect:productList.pr");
			}else {
				mv.addObject("errorMsg", "상품삭제 실패");
				mv.setViewName("common/errorPage");
			}
		}else {
			mv.addObject("errorMsg", "상품삭제 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	@ResponseBody
	@RequestMapping(value="endSell.pr", produces="json/application; charset=UTF-8")
	public String endSell(int proNo
								,HttpSession session
								,Model model) {
		
		int result = productService.endSell(proNo);
		
		return new Gson().toJson(result);
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000) +10000;
		System.out.println(originName);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime+ranNum+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}	
	
	
	//판매현황
	@ResponseBody
	@RequestMapping(value="sale.me", produces="application/json; charset=UTF-8")
	public String sale(String userId, int cPage) {
		int currentPage = cPage;
		int listCount = productService.selectListCount(userId);
		
//		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
//		System.out.println(pi.getEndPage());
		
		ArrayList<Product> list = productService.selectList(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		
		return new Gson().toJson(ob);
	}
	
	
	@RequestMapping("postBox.me")
	public String postBox(int proNo, Model model ) {
		
		model.addAttribute("proNo",proNo);
		return "common/postBox";
	}
	
	@RequestMapping("postInsert.me")
	public String postInsert(Postbox p,HttpSession session ,Model model) {
		
//		System.out.println(p);
		
		int result = productService.postInsert(p); 
		
		if(result>0) {
			session.setAttribute("alertMsg", "운송장 등록 완료");
			return "redirect:myPageSale.me";
			
		}else {//실패
			model.addAttribute("errorMsg","운송장 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="post.me", produces="application/json; charset=UTF-8")
	public String post(String userId, int pPage) {
		int currentPage = pPage;
		int listCount = productService.selectListCountt(userId);
		
//		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
//		System.out.println(pi.getEndPage());
		ArrayList<Postbox> list = productService.selectListPost(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="attend.me", produces="application/json; charset=UTF-8")
	public String attend(String userId, int sPage) {
//		System.out.println(userId);
		int currentPage = sPage;
		int listCount = productService.selectListCounttt(userId);
		
//		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
//		System.out.println(pi.getEndPage());
		
		ArrayList<Bid> list = productService.selectListAttend(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
//		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="bid.me", produces="application/json; charset=UTF-8")
	public String bid(String userId, int bPage) {
		int currentPage = bPage;
		int listCount = productService.selectListCountttt(userId);
		
//		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
//		System.out.println(pi.getEndPage());		
		ArrayList<Bid> list = productService.selectListBid(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
//		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="nPost.me", produces="application/json; charset=UTF-8")
	public String nPost(String userId, int nPage) {
		int currentPage = nPage;
		int listCount = productService.selectListCounttttt(userId);
		
//		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
//		System.out.println(pi.getEndPage());		
		ArrayList<Postbox> list = productService.selectListnPost(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
//		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
//	================================================검색================================================
//	@GetMapping("getSearchList.pr")
//	@ResponseBody
//	public String getSearchList(Model model, Product p) {
//		
//		
//		 List<Product> proList =  productService.getSearchList(p);
//		 
//		model.addAttribute("proList",proList);
//
//		model.addAttribute("searchType",p.getSearchType());
//		model.addAttribute("searchKeyword",p.getSearchKeyword());
//		
//		return "product/searchList";
//		
//	}
	
	
	
	
	
@RequestMapping("searchList.pr")
	public ModelAndView getSearchList(
			int cPage,
			String searchType,
			String searchKeyword,
			ModelAndView mv) {

//페이징
int listCount = productService.searchProListCount(searchType, searchKeyword);
int pageLimit =10;
int boardLimit = 10;

PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);

//리스트 불러오기
List<Product> plist = productService.getSearchList(searchType, searchKeyword,pi);


mv.addObject("searchType",searchType);
mv.addObject("searchKeyword",searchKeyword);
mv.addObject("pi",pi);
mv.addObject("plist",plist).setViewName("product/productListView");

return mv;
}


//================================================정렬================================================
@RequestMapping("filterList.pr")
public ModelAndView filterList(
		int cPage,
		String searchType,
		String searchKeyword,
		String sort,
		ModelAndView mv) {



int listCount = productService.searchProListCount(searchType,searchKeyword); //처리필
//int listCount = productService.selectProListCount(); //처리필

int pageLimit =10;
int boardLimit = 10;

PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);

if(searchType != null && searchKeyword != null) {
List<Product> plist = productService.filterList(searchType, searchKeyword, sort,pi);

mv.addObject("searchType",searchType);
mv.addObject("searchKeyword",searchKeyword);
mv.addObject("pi",pi);
mv.addObject("plist",plist).setViewName("product/productListView");

}else {

List<Product> plist = productService.filterListNoS(sort,pi);

mv.addObject("searchType","");
mv.addObject("searchKeyword","");
mv.addObject("pi",pi);
mv.addObject("plist",plist).setViewName("product/productListView");

}
return mv;
}


//================================================찜하기================================================
//찜 추가
@ResponseBody	
@RequestMapping(value="addWishlist.my", produces="application/json; charset=UTF-8")
public String addWishlist(String userId, int proNo, HttpSession session, Model model) {

System.out.println(proNo);

ProLike l = new ProLike();
l.setProNo(proNo);
l.setUserId(userId);

int result = productService.addWishlist(l);
return new Gson().toJson(result);

//if(result > 0) {
//
//model.addAttribute("userId", userId);
//model.addAttribute("l", l);
//session.setAttribute("alertMsg","관심 목록에 추가되었습니다."); //test
//return "redirect:productDetail.pr?pNo=" + proNo;
//}
//else {
//model.addAttribute("errorMsg", "관심 목록 추가 실패");
//return "common/errorPage";
//}
}


//찜 삭제
@ResponseBody
@RequestMapping(value="removeWishlist.my", produces="application/json; charset=UTF-8")
public String removeWishlist(String userId, int proNo, HttpSession session, Model model) {

ProLike l = new ProLike();
l.setProNo(proNo);
l.setUserId(userId);

int result = productService.removeWishlist(l);

return new Gson().toJson(result);
}




@RequestMapping("productDetail.pro")
public String productDetail() {
return "product/productDetail";
}

//	============================= 마이페이지 행 삭제 =================================
	//판매현황 삭제
	@RequestMapping(value="deleteSale.my",  method = RequestMethod.POST)
	@ResponseBody
	public void deleteSale(Product p,HttpSession session,
					String[] chArr) {
		
		
//		System.out.println(Arrays.toString(chArr));
		
		int result = productService.deleteSale(chArr);
		
	}
	
	
	//운송장조회 삭제
		@RequestMapping(value="deletePost.my",  method = RequestMethod.POST)
		@ResponseBody
		public void deletePost(Product p,HttpSession session,
						String[] chArr2) {
			
			
//			System.out.println(Arrays.toString(chArr2));
			
			int result = productService.deletePost(chArr2);
			
		}
	
	//낙찰현황 삭제
		@RequestMapping(value="deleteBid.my",  method = RequestMethod.POST)
		@ResponseBody
		public void deleteAttend(Product p,HttpSession session,
						String[] chArr3) {
					
					
//			System.out.println(Arrays.toString(chArr3));
					
			int result = productService.deleteBid(chArr3);
					
		}
		
		
	//운송장 삭제
		@RequestMapping(value="deleteNpost.my",  method = RequestMethod.POST)
		@ResponseBody
		public void nPostDelete(Product p,HttpSession session,
						String[] chArr4) {
					
					
			System.out.println(Arrays.toString(chArr4));
					
			int result = productService.nPostDelete(chArr4);
					
		}
}
