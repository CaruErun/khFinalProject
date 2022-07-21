package com.kh.samsam.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA {

	private int qnaNo;
	private String qnaTitle;
	private int qnaCateNo;
	private String qnaContent;
	private String qnaId;
	private Date createDate;
	private String answerContent;
	private Date answerDate;
	private int qnaType;
	private int proNo;
	private String qnaStatus;
	private String ansStatus;
}
