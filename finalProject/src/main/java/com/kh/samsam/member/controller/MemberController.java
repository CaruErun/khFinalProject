package com.kh.samsam.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.member.model.service.MemberService;
import com.kh.samsam.member.model.vo.MemberChart;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 차트 신규 회원
	@RequestMapping("new.me")
	public ModelAndView selectNewMember(ModelAndView mv) {

		MemberChart[] narr = new MemberChart[12];
		
		narr[0] = new MemberChart("2022-01-01", "2022-01-31");
		narr[1] = new MemberChart("2022-02-01", "2022-02-28");
		narr[2] = new MemberChart("2022-03-01", "2022-03-31");
		narr[3] = new MemberChart("2022-04-01", "2022-04-30");
		narr[4] = new MemberChart("2022-05-01", "2022-05-31");
		narr[5] = new MemberChart("2022-06-01", "2022-06-30");
		narr[6] = new MemberChart("2022-07-01", "2022-07-31");
		narr[7] = new MemberChart("2022-08-01", "2022-08-31");
		narr[8] = new MemberChart("2022-09-01", "2022-09-30");
		narr[9] = new MemberChart("2022-10-01", "2022-10-31");
		narr[10] = new MemberChart("2022-11-01", "2022-11-30");
		narr[11] = new MemberChart("2022-12-01", "2022-12-31");
		
		int[] countArr = new int[12];
		
		for(int i=0; i<countArr.length; i++) {
			countArr[i] = memberService.selectNewMember(narr[i]);
		}
		
		double most = 0;
		for(int i=0; i<countArr.length; i++) {
			if(countArr[i]>most){
				most=countArr[i];
			}
		}
		most = most*1.1;
		
		MemberChart MemberChartNew = new MemberChart(countArr, most);
		
		mv.addObject("MemberChartNew", MemberChartNew);
		mv.setViewName("member/chartNewMember");
		return mv;
	}
	// 차트 탈퇴 회원
	@RequestMapping("remove.me")
	public ModelAndView selectRemoveMember(ModelAndView mv) {
		
		MemberChart[] rarr = new MemberChart[12];

		rarr[0] = new MemberChart("2022-01-01", "2022-01-31");
		rarr[1] = new MemberChart("2022-02-01", "2022-02-28");
		rarr[2] = new MemberChart("2022-03-01", "2022-03-31");
		rarr[3] = new MemberChart("2022-04-01", "2022-04-30");
		rarr[4] = new MemberChart("2022-05-01", "2022-05-31");
		rarr[5] = new MemberChart("2022-06-01", "2022-06-30");
		rarr[6] = new MemberChart("2022-07-01", "2022-07-31");
		rarr[7] = new MemberChart("2022-08-01", "2022-08-31");
		rarr[8] = new MemberChart("2022-09-01", "2022-09-30");
		rarr[9] = new MemberChart("2022-10-01", "2022-10-31");
		rarr[10] = new MemberChart("2022-11-01", "2022-11-30");
		rarr[11] = new MemberChart("2022-12-01", "2022-12-31");
		
		int[] countArr = new int[12];
		for(int i=0; i<countArr.length; i++) {
			countArr[i] = memberService.selectRemoveMember(rarr[i]);
		}
		
		double most = 0;
		for(int i=0; i<countArr.length; i++) {
			if(countArr[i]>most){
				most=countArr[i];
			}
		}
		most = most*1.1;
		
		MemberChart MemberChartRemove = new MemberChart(countArr, most);
		
		mv.addObject("MemberChartRemove", MemberChartRemove);
		mv.setViewName("member/chartRemoveMember");
		
		return mv;
	}

}
