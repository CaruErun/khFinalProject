package com.kh.samsam.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductImages;

@Repository
public class ProductDao {

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

