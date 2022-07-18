package com.kh.samsam.product.model.vo;

import lombok.Data;

@Data
public class ProductChart {

	private int[] arr = new int[12];
	private double most;
	private double tmost;
	private String date1;
	private String date2;
	
	public ProductChart(String date1, String date2) {
		super();
		this.date1 = date1;
		this.date2 = date2;
	}

	public ProductChart(int[] arr, double most) {
		super();
		this.arr = arr;
		this.most = most;
	}




}
