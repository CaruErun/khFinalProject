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
public class Member {
	
	private String userId;	//	USER_ID	VARCHAR2(50 BYTE)
	private String userPw;	//	USER_PW	VARCHAR2(100 BYTE)
	private String userName;	//	USER_NAME	VARCHAR2(100 BYTE)
	private Date userBirth;	//	USER_BIRTH	DATE
	private String gender;	//	GENDER	VARCHAR2(1 BYTE)
	private String email;	//	EMAIL	VARCHAR2(100 BYTE)
	private String phone;	//	PHONE	VARCHAR2(100 BYTE)
	private String address;	//	ADDRESS	VARCHAR2(100 BYTE)
	private String addressNum;	//	ADDRESS_NUM	VARCHAR2(30 BYTE)
	private String addressDetail;	//	ADDRESS_DETAIL	VARCHAR2(100 BYTE)
	private Date enterDate;	//	ENTER_DATE	DATE
	private Date banDate;	//	BAN_DATE	DATE
	private int banCount;	//	BAN_COUNT	NUMBER
	private String userStatus;	//	USER_STATUS	VARCHAR2(1 BYTE)
	private String emailFirst;
	private String emailBack;
	private String phoneFirst;
	private String phoneMiddle;
	private String phoneBack;
	
	private String userPwd;
	private String newPwd;
	private String newPwdCheck;
	
	private String buyerId;
	
	
	
	
	
	

}
