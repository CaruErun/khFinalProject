
package com.kh.samsam.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data 
public class Member {
	

	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String addressNum;
	private String addressDetail;
	private Date enterDate;
	private Date banDate;
	private int banCount;
	private String userStatus;

	
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

