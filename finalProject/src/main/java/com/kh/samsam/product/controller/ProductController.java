package com.kh.samsam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		System.out.println(list);
		
		int result =productService.insertProduct(p);
		if(result>0) {
			int result1 =productService.insertProductImages(list);
			if(result1>0) {
				session.setAttribute("alertMsg", "상품등록 성공");
				mv.setViewName("redirect:productList.pr");
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
		System.out.println(listCount);
		int pageLimit =10;
		int boardLimit = 20;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> plist = productService.selectProductList(pi);
		System.out.println(plist);
		model.addAttribute("plist",plist);
		model.addAttribute("pi",pi);
		return "product/productListView";
	}
	@RequestMapping("productDetail.pr")
	public String selectProduct(int pNo
								,Model model) {
		System.out.println(pNo);
		
		int result=productService.increaseCount(pNo);
		if(result > 0) {
			Product p =productService.selectProduct(pNo);
			ArrayList<ProductImages> piList = productService.selectImgList(pNo);
			model.addAttribute("p",p);
			model.addAttribute("piList",piList);
			return "product/productDetail";
		}else {
			model.addAttribute("errorMsg", "상품조회 실패");
			return "common/errorPage";
		}
		
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
	
	

	@ResponseBody
	@RequestMapping(value="sale.me", produces="application/json; charset=UTF-8")
	public String sale(String userId, int cPage) {
		int currentPage = cPage;
		int listCount = productService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
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
		
		System.out.println(p);
		
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
		int listCount = productService.selectListCountt();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Postbox> list = productService.selectListPost(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="attend.me", produces="application/json; charset=UTF-8")
	public String attend(String userId, int sPage) {
		System.out.println(userId);
		int currentPage = sPage;
		int listCount = productService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		System.out.println(pi);
		
		ArrayList<Bid> list = productService.selectListAttend(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
	@ResponseBody
	@RequestMapping(value="bid.me", produces="application/json; charset=UTF-8")
	public String bid(String userId, int bPage) {
		System.out.println(userId);
		int currentPage = bPage;
		int listCount = productService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		System.out.println(pi);
		
		ArrayList<Bid> list = productService.selectListBid(userId,pi);
		
		Map<String, Object> ob = new HashMap<String,Object>();
		
		ob.put("pi", pi);
		ob.put("list", list);
		
		System.out.println(list);
		
		return new Gson().toJson(ob);
	}
	
//	================================================검색================================================
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
		List<Product> plist = productService.getSearchList(searchType, searchKeyword);
		
		
		mv.addObject("searchType",searchType);
		mv.addObject("searchKeyword",searchKeyword);
		mv.addObject("pi",pi);
		mv.addObject("plist",plist).setViewName("product/productListView");
		
		return mv;
	}
	

//	================================================정렬================================================
	@RequestMapping("filterList.pr")
	public ModelAndView filterList(
							int cPage,
							String searchType,
							String searchKeyword,
							String sort,
							ModelAndView mv) {
		

		System.out.println(searchType);
		System.out.println(searchKeyword);
		System.out.println(sort);

		int listCount = productService.selectProListCount();
		
		int pageLimit =10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
		
		if(searchType != null && searchKeyword != null) {
			List<Product> plist = productService.filterList(searchType, searchKeyword, sort);
		
			mv.addObject("searchType",searchType);
			mv.addObject("searchKeyword",searchKeyword);
			mv.addObject("pi",pi);
			mv.addObject("plist",plist).setViewName("product/productListView");
		}
		
			List<Product> plist = productService.filterListNoS(sort);
			
			mv.addObject("searchType","");
			mv.addObject("searchKeyword","");
			mv.addObject("pi",pi);
			mv.addObject("plist",plist).setViewName("product/productListView");
			
			return mv;
	}
	
	
//	================================================찜하기================================================
	@RequestMapping("pickProduct.pr")
	public String pickProduct(Product p) {
		
		
		return "main";
	}
	
	// 채팅 넘어가기
	@ResponseBody
	@RequestMapping(value="selectTraded.pr", produces="application/json; charset=UTF-8")
	public String selectTraded(String userId) {
		
		int[] arrBuy = productService.selectTradedBuy(userId);
		
		return new Gson().toJson(arrBuy);
	}
	
	
	
	
}
