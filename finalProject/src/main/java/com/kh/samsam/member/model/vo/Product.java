package com.kh.samsam.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본 생성자
@AllArgsConstructor //모든 필드를 매개변수로 갖는 생성자
@Setter //setter
@Getter //getter
@ToString //toString
@EqualsAndHashCode //equals,hashcode
@Data //위에 있는 모든 메소드를 포함하는 어노테이션

public class Product {
	private int proNo;	//	PRO_NO	NUMBER
	private String proTitle;	//	PRO_TITLE	VARCHAR2(50 BYTE)
	private String proContent;	//	PRO_CONTENT	VARCHAR2(1000 BYTE)
	private String sellId;	//	SELL_ID	VARCHAR2(50 BYTE)
	private int proPrice;	//	PRO_PRICE	NUMBER
	private int bidIncrement;	//	BID_INCREMENT	NUMBER
	private int wishPrice;	//	WISH_PRICE	NUMBER
	private int postPrice;	//	POST_PRICE	NUMBER
	private Date startDate;	//	START_DATE	DATE
	private Date endDate;	//	END_DATE	DATE
	private int proCateNo;	//	PRO_CATE_NO	NUMBER
	private int tradeCateNo;	//	TRADE_CATE_NO	NUMBER
	private String tradeLocation;	//	TRADE_LOCATION	VARCHAR2(50 BYTE)
	private int count;	//	COUNT	NUMBER
	private String proStatus;	//	PRO_STATUS	VARCHAR2(1 BYTE)

}
