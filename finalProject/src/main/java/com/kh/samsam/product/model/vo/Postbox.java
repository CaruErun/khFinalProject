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

public class Postbox {
	private String pboxNo;	//	PBOX_NO	NUMBER
	private String pboxName;	//	PBOX_NAME	VARCHAR2(500 BYTE)
	private int proNo;//	PRO_NO	NUMBER
	private int proCateNo;
	private String proTitle;
}
