package com.kh.samsam.product.model.vo;

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
public class Bid {
	private int bidNo;	//	BID_NO	NUMBER
	private String buyerId;	//	BUYER_ID	VARCHAR2(50 BYTE)
	private int proNo;	//	PRO_NO	NUMBER
	private int bidPrice;	//	BID_PRICE	NUMBER
	private String bidStatus;	//	BID_STATUS	VARCHAR2(1 BYTE)
	
	private int proCateNo;	//	PRO_CATE_NO	NUMBER
	private String proTitle;
	private String endDate;
}
