package com.kh.samsam.product.model.service;


import java.util.ArrayList;
import java.util.List;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.ProLike;
import com.kh.samsam.product.model.vo.Bid;
import com.kh.samsam.product.model.vo.Postbox;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductChart;
import com.kh.samsam.product.model.vo.ProductImages;

public interface ProductService {

	// 신규 등록 상품 수량
	int productEnrollAmount(ProductChart c);

	// 거래 상품 수량
	int productTradeAmount(ProductChart c);

	// 신규 등록 상품 금액
	int productEnrollMoney(ProductChart c);

	// 거래 금액
	int productTradeMoney(ProductChart c);
	
	int insertProduct(Product p);
	ArrayList<Category> selectCategoryList(int categoryNo);
	int insertProductImages(ArrayList<ProductImages> list);
	
	
	int selectProListCount();
	ArrayList<Product> selectProductList(PageInfo pi);
	int increaseCount(int pNo);
	Product selectProduct(int pNo);
	ArrayList<ProductImages> selectImgList(int pNo);
	
	
	
	//리스트 조회 해오기(판매현황)
	ArrayList<Product> selectList(String userId, PageInfo pi);

	//운송장 등록
	int postInsert(Postbox p);
	
	//리스트 조회 해오기
	ArrayList<Postbox> selectListPost(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListAttend(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListBid(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Postbox> selectListnPost(String userId, PageInfo pi);
	
	//판매
	int selectListCount(String userId);

	//운송장
	int selectListCountt(String userId);
	
	//응찰
	int selectListCounttt(String userId);
	
	//낙찰
	int selectListCountttt(String userId);

	//낙찰 운송장
	int selectListCounttttt(String userId);
	

	//검색 전체 목록 => 옵션, 키워드
		List<Product> getSearchList(String searchType, String searchKeyword,PageInfo pi);

		//검색 레코드 갯수
		int searchProListCount(String searchType, String searchKeyword);
		
		//정렬 (with 검색)
		List<Product> filterList(String searchType, String searchKeyword, String sort,PageInfo pi);

		//정렬 (without 검색)
		List<Product> filterListNoS(String sort, PageInfo pi);





		
		//찜 추가
		int addWishlist(ProLike l);

		//찜 삭제
		int removeWishlist(ProLike l);
		
		//찜 목록 보내기
		int prolike(int pNo, String userId);

	//판매현황 삭제
	int deleteSale(String[] chArr);

	//운송장  조회 삭제
	int deletePost(String[] chArr2);

	//낙찰현황 삭제
	int deleteBid(String[] chArr3);

	//판매운송장 삭제
	int nPostDelete(String[] chArr4);


	int insertBid(Bid b);

	int selectBidPrice(int proNo);

	int buyImeddiately(int proNo);

	int deleteProduct(int proNo);

	int deleteProImg(int proNo);

	int selectProNo(String sellId);

	int endSell(int proNo);

	//리스트 찜
	
	ArrayList<ProLike> selectProlikeList(String userId, PageInfo pi);
	ArrayList<ProLike> selectProlikeSearchList(String userId,String searchType, String searchKeyword, String sort, PageInfo pi);
	
	
}
