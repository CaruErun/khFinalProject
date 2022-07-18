package com.kh.samsam.product.model.service;

import com.kh.samsam.product.model.vo.ProductChart;

public interface ProductService {

	// 신규 등록 상품 수량
	int productEnrollAmount(ProductChart c);

	// 거래 상품 수량
	int productTradeAmount(ProductChart c);

	// 신규 등록 상품 금액
	int productEnrollMoney(ProductChart c);

	// 거래 금액
	int productTradeMoney(ProductChart c);


}
