package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.samsam.common.model.vo.Category;
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
	Object insertProductImages(ArrayList<ProductImages> list);
	
	
	//검색
	List<Product> getSearchList(Product p);
}
