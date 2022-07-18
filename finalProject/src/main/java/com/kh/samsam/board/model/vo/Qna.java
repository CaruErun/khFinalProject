package com.kh.samsam.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	
	private int qnaNo;				//	QNA_NO	NUMBER						
	private String qnaTitle;		//	QNA_TITLE	VARCHAR2(100 BYTE)
	private String qnaCateNo;			//	QNA_CATE_NO	NUMBER					QNA구분
	private String qnaContent;		//	QNA_CONTENT	VARCHAR2(1000 BYTE)
	private String qnaId;			//	QNA_ID	VARCHAR2(50 BYTE)			회원아이디		
	private Date createDate;		//	CREATE_DATE	DATE	
	private String answerContent;	//	ANSWER_CONTENT	VARCHAR2(1000 BYTE)
	private Date answerDate;		//	ANSWER_DATE	DATE
	private int qnaType;			//	QNA_TYPE	NUMBER					1: 판매자, 2: 관리자
	private int proNo;				//	PRO_NO	NUMBER						qnaType이 1일 경우 사용
	private String qnaStatus;		//	QNA_STATUS	VARCHAR2(1 BYTE)
	private String ansStatus;
}
