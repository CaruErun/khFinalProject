package com.kh.samsam.common.model.vo;

import lombok.Data;


@Data
public class PageInfo {

	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	

	
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	
	
	
	
	
	
	//======필터 및 검색용 객체 생성======
	//정렬용 객체
	private String sort; 
	
	//검색용 객체
	private String searchType;	//검색 타입
	private String searchKeyword;	//검색 키워드
	
	
	
	
	
	
	
	

}
