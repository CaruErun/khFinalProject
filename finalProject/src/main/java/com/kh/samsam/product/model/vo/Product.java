package com.kh.samsam.product.model.vo;




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
	private int curPrice;
	private String startDate;
	private String bidDate;
	private String endDate;
	private String proCateNo;
	private String tradeCateNo;
	private String tradeLocation;
	private int count;
	private int bidCount;
	private String path;
	private String proStatus;


	
	
	//======필터 및 검색용 객체 생성======
	//정렬용 객체
	private String sort; 
	
	//검색용 객체
	private String searchType;	//검색 타입
	private String searchKeyword;	//검색 키워드
	

}
