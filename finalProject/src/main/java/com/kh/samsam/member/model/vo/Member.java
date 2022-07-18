package com.kh.samsam.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {

		private String userId;					//	USER_ID	VARCHAR2(50 BYTE)
		private String userPw;				//	USER_PW	VARCHAR2(100 BYTE)
		private String userName;					//	USER_NAME	VARCHAR2(100 BYTE)
		private Date userBirth;					//	USER_BIRTH	DATE
		private String gender;					//	GENDER	VARCHAR2(1 BYTE)
		private String email;					//	EMAIL	VARCHAR2(100 BYTE)
		private String phone;					//	PHONE	VARCHAR2(100 BYTE)
		private String address;					//	ADDRESS	VARCHAR2(100 BYTE)
		private String addressNum;					//	ADDRESS_NUM	VARCHAR2(30 BYTE)
		private String addressDerail;					//	ADDRESS_DETAIL	VARCHAR2(100 BYTE)
		private Date enterDate;					//	ENTER_DATE	DATE
		private Date banDate;					//	BAN_DATE	DATE
		private int banCount;					//	BAN_COUNT	NUMBER
		private String userStatus;					//	USER_STATUS	VARCHAR2(1 BYTE)
}
