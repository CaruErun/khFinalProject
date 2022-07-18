package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.dao.ProductDao;
import com.kh.samsam.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	@Autowired SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int insertProduct(Product p) {
		return productDao.insertProduct(sqlSession,p);
	}



	@Override
	public ArrayList<Category> selectCategoryList(int categoryNo) {
		return productDao.selectCategoryList(sqlSession,categoryNo);
	}


	
	//검색
	@Override
	public List<Product> getSearchList(Product P) {
		
		return productDao.getSearchList(sqlSession,p);
	}

}
