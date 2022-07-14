package com.kh.samsam.sim.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;

@Getter
@Data
public class QnA {

	private int qnaNo;
	private String qnaTitle;
	private int qnaCateNo;
	private String qnaContent;
	private String qnaId;
	private Date craeteDate;
	private String answerContent;
	private Date answerDate;
	private int qnaType;
	private int proNo;
	private String qnaStatus;
	private String ansStatus;
}
