package com.kh.samsam.member.model.vo;

import lombok.Data;

@Data				
public class MemberChart {
	
	private int[] carr = new int[12];
	private String date1;
	private String date2;
	private double most;
	
	public MemberChart(String date1, String date2) {
		super();
		this.date1 = date1;
		this.date2 = date2;
	}

	public MemberChart(int[] carr, double most) {
		super();
		this.carr = carr;
		this.most = most;
	}




	
	
	
}
