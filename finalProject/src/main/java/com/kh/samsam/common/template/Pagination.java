package com.kh.samsam.common.template;

//import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.kh.samsam.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil(((double)listCount/boardLimit));
		int startPage = ((currentPage-1)/pageLimit)*pageLimit+1;
		int endPage = startPage+pageLimit-1;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}
	
	
	
	
	// 검색기능
//	public String makeSearch(int page, PageInfo pageInfo) {
//		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
//				.queryParam("perPageNum", pageInfo.getPerPageNum())
//				.queryParam("searchType", ((PageInfo) pageInfo).getSearchType())
////				.queryParam("keyword", encoding(((PageInfo) pageInfo).getSearchKeyword()))
//				.queryParam("keyword", ((PageInfo) pageInfo).getSearchKeyword())
//				.queryParam("bgno", pageInfo.getBgno())
//				.queryParam("sort",pageInfo.getSort()).build()
//				;
//		return uriComponents.toUriString();
		
		/*
		 * uriComponents : URI를 동적으로 생성해주는 클래스
		 * 				     파라미터가 조합된 URI를 손쉽게 만들어주어서 코드상 직접 문자열을 조합할 때 생기는 실수를 방지할 수 있음!
		 */
//	}
	
	
	
	
}
