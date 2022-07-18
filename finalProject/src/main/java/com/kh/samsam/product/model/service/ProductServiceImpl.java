package com.kh.samsam.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.product.model.dao.ProductDao;
import com.kh.samsam.product.model.vo.ProductChart;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int productEnrollAmount(ProductChart c) {
		int count = productDao.productEnrollAmount(sqlSession, c);
		return count;
	}
	
	@Override
	public int productTradeAmount(ProductChart c) {
		int count = productDao.productTradeAmount(sqlSession, c);
		return count;
	}

	@Override
	public int productEnrollMoney(ProductChart c) {
		int sum = productDao.productEnrollMoney(sqlSession, c);
		return sum;
	}

	@Override
	public int productTradeMoney(ProductChart c) {
		int sum = productDao.productTradeMoney(sqlSession, c);
		return sum;
	}


}
