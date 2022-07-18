package com.kh.samsam.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samsam.product.model.service.ProductService;
import com.kh.samsam.product.model.vo.ProductChart;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// 차트 신규 등록, 거래 개수
	@RequestMapping("product.ct")
	public ModelAndView productEnrollAmount(ModelAndView mv) {

		ProductChart[] paeArr = new ProductChart[12];		
		paeArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		paeArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		paeArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		paeArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		paeArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		paeArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		paeArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		paeArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		paeArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		paeArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		paeArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		paeArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counteArr = new int[12];	
		for(int i=0; i<counteArr.length; i++) {
			counteArr[i] = productService.productEnrollAmount(paeArr[i]);
		}
		double emost = 0;
		for(int i=0; i<counteArr.length; i++) {
			if(counteArr[i]>emost){
				emost=counteArr[i];
			}
		}
		emost = emost*1.1;
		
		ProductChart ctEnrollAmount = new ProductChart(counteArr, emost);	
		
		// ---------------------------------------------------------------
		
		ProductChart[] patArr = new ProductChart[12];
		patArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		patArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		patArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		patArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		patArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		patArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		patArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		patArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		patArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		patArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		patArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		patArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counttArr = new int[12];
		for(int i=0; i<counttArr.length; i++) {
			counttArr[i] = productService.productTradeAmount(patArr[i]);
		}
		double tmost = 0;
		for(int i=0; i<counttArr.length; i++) {
			if(counttArr[i]>tmost){
				tmost=counttArr[i];
			}
		}
		tmost = tmost*1.1;
		
		ProductChart ctTradeAmount = new ProductChart(counttArr, tmost);
		
		mv.addObject("ctEnrollAmount", ctEnrollAmount);
		mv.addObject("ctTradeAmount", ctTradeAmount);
		mv.setViewName("product/chartProductAmount");
		
		return mv;
	}
	
	// 차트 신규 등록 금액
	@RequestMapping("money.ct")
	public ModelAndView productEnrollMoney(ModelAndView mv) {
		
		ProductChart[] pmeArr = new ProductChart[12];
		pmeArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		pmeArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		pmeArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		pmeArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		pmeArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		pmeArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		pmeArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		pmeArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		pmeArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		pmeArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		pmeArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		pmeArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counteArr = new int[12];
		
		for(int i=0; i<counteArr.length; i++) {
			counteArr[i] = productService.productEnrollMoney(pmeArr[i]);
		}
		
		double emost = 0;
		for(int i=0; i<counteArr.length; i++) {
			if(counteArr[i]>emost){
				emost=counteArr[i];
			}
		}
		emost = emost*1.1;
		
		ProductChart ctEnrollMoney = new ProductChart(counteArr, emost);
		
		//---------------------------------------------------------------
		
		ProductChart[] pmtArr = new ProductChart[12];
		pmtArr[0] = new ProductChart("2022-01-01", "2022-01-31");
		pmtArr[1] = new ProductChart("2022-02-01", "2022-02-28");
		pmtArr[2] = new ProductChart("2022-03-01", "2022-03-31");
		pmtArr[3] = new ProductChart("2022-04-01", "2022-04-30");
		pmtArr[4] = new ProductChart("2022-05-01", "2022-05-31");
		pmtArr[5] = new ProductChart("2022-06-01", "2022-06-30");
		pmtArr[6] = new ProductChart("2022-07-01", "2022-07-31");
		pmtArr[7] = new ProductChart("2022-08-01", "2022-08-31");
		pmtArr[8] = new ProductChart("2022-09-01", "2022-09-30");
		pmtArr[9] = new ProductChart("2022-10-01", "2022-10-31");
		pmtArr[10] = new ProductChart("2022-11-01", "2022-11-30");
		pmtArr[11] = new ProductChart("2022-12-01", "2022-12-31");
		int[] counttArr = new int[12];
		
		for(int i=0; i<counttArr.length; i++) {
			counttArr[i] = productService.productTradeMoney(pmtArr[i]);
		}
		
		double tmost = 0;
		for(int i=0; i<counttArr.length; i++) {
			if(counttArr[i]>tmost){
				tmost=counttArr[i];
			}
		}
		tmost = tmost*1.1;
		
		ProductChart ctTradeMoney = new ProductChart(counttArr, tmost);
		
		mv.addObject("ctEnrollMoney", ctEnrollMoney);
		mv.addObject("ctTradeMoney", ctTradeMoney);
		mv.setViewName("product/chartProductMoney");
		
		return mv;
	}

}
