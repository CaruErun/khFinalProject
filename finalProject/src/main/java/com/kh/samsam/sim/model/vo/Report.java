package com.kh.samsam.sim.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class Report {

		private int reportNo;							//	REPORT_NO	NUMBER
		private String reportId;						//	REPORT_ID	VARCHAR2(50 BYTE)
		private String reportedId;						//	REPORTED_ID	VARCHAR2(50 BYTE)
		private int proNo;								//	PRO_NO	NUMBER
		private int reportCategoryNo;					//	REPORT_CATE_NO	NUMBER
		private String reportContent;					//	REPORT_CONTENT	VARCHAR2(1000 BYTE)
		private Date createDate;						//CREATE_DATE DATE
		private String reportStatus;					//	REPORT_STATUS	VARCHAR2(1 BYTE)
}
