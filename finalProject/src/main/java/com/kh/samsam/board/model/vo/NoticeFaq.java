package com.kh.samsam.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeFaq {
	
	private int nfNo;			//	NF_NO	NUMBER
	private int nfType;			//	NF_TYPE	NUMBER
	private String nfTitle;		//	NF_TITLE	VARCHAR2(100 BYTE)
	private int nfCateNo;		//	NF_CATE_NO	NUMBER
	private String nfContent;	//	NF_CONTENT	VARCHAR2(1000 BYTE)
	private Date createDate;	//	CREATE_DATE	DATE
	private int count;			//	COUNT	NUMBER
	private String nfStatus;	//	NF_STATUS	VARCHAR2(1 BYTE)
	private int rnum;
}
