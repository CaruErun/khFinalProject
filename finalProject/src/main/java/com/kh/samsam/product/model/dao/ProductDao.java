package com.kh.samsam.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductChart;
import com.kh.samsam.product.model.vo.ProductImages;

@Repository
public class ProductDao {

	public int productEnrollAmount(SqlSessionTemplate sqlSession, ProductChart c) {
		int count = sqlSession.selectOne("productMapper.productEnrollAmount", c);
		return count;
	}
	
	public int productTradeAmount(SqlSessionTemplate sqlSession, ProductChart c) {
		int count = sqlSession.selectOne("productMapper.productTradeAmount", c);
		return count;
	}
	
	public int productEnrollMoney(SqlSessionTemplate sqlSession, ProductChart c) {
		if(sqlSession.selectOne("productMapper.productEnrollMoney", c)==null) {
			int sum = 0;
			return sum;
		}else {
			int sum = sqlSession.selectOne("productMapper.productEnrollMoney", c); 
			return sum;
		}
	}

	public int productTradeMoney(SqlSessionTemplate sqlSession, ProductChart c) {		
		if(sqlSession.selectOne("productMapper.productTradeMoney", c)==null) {
			int sum = 0;
			return sum;
		}else {
			int sum = sqlSession.selectOne("productMapper.productTradeMoney", c); 
			return sum;
		}
	}
	public ArrayList<Category> selectCategoryList(SqlSessionTemplate sqlSession, int categoryNo) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectCategoryList",categoryNo);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct",p);
	}

	public Object insertProductImages(SqlSessionTemplate sqlSession, ArrayList<ProductImages> list) {
		return sqlSession.insert("productMapper.insertProductImages",list);
	}



	
	//검색
	public List<Product> getSearchList(SqlSessionTemplate sqlSession,Product p) {
		return sqlSession.selectList("productMapper.getSearchList",p);
	}

	
	
	
}
