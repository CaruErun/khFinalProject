package com.kh.samsam.product.model.service;


import java.util.ArrayList;
import java.util.List;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
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
	
	
	
//	//리스트 조회 해오기
	ArrayList<Product> selectList(String userId, PageInfo pi);

	//운송장 등록
	int postInsert(Postbox p);
	
	//리스트 조회 해오기
	ArrayList<Postbox> selectListPost(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListAttend(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListBid(String userId, PageInfo pi);

	//판매
	int selectListCount();

	//운송장
	int selectListCountt();
	
	

	//검색 전체 목록 => 옵션, 키워드
	List<Product> getSearchList(String searchType, String searchKeyword);

	//검색 레코드 갯수
	int searchProListCount(String searchType, String searchKeyword);
	
	//정렬 (with 검색)
	List<Product> filterList(String searchType, String searchKeyword, String sort);

	//정렬 (without 검색)
	List<Product> filterListNoS(String sort);



	int[] selectTradedBuy(String userId);

	
	
}
