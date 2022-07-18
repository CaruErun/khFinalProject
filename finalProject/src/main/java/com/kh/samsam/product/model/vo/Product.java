package com.kh.samsam.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {

	private int proNo;
	private String proTitle;
	private String proContent;
	private String sellId;
	private int proPrice;
	private int wishPrice;
	private int postPrice;
	private Date startDate;
	private String bidDate;
	private Date endDate;
	private String proCateNo;
	private String tradeCateNo;
	private String tradeLocation;
	private int count;
	private String proStatus;


	//검색용 객체
	private String searchType;	//검색 타입
	private String searchKeyword;	//검색 키워드

}
