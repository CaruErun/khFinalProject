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
}
