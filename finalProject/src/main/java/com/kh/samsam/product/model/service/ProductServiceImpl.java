package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.member.model.vo.Postbox;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.dao.ProductDao;
import com.kh.samsam.product.model.vo.ProductChart;
import com.kh.samsam.product.model.vo.ProductImages;

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
	@Override
	public int insertProduct(Product p) {
		return productDao.insertProduct(sqlSession,p);
	}



	@Override
	public ArrayList<Category> selectCategoryList(int categoryNo) {
		return productDao.selectCategoryList(sqlSession,categoryNo);
	}



	@Override
	public Object insertProductImages(ArrayList<ProductImages> list) {
		return productDao.insertProductImages(sqlSession,list);
	}
	
	//검색
	@Override
	public List<Product> getSearchList(Product p) {
		
		return productDao.getSearchList(sqlSession,p);
	}

	

	
}
