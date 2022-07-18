package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.vo.Product;

public interface ProductService {
	
	int insertProduct(Product p);
	ArrayList<Category> selectCategoryList(int categoryNo);
	
	
	//검색
	List<Product> getSearchList(Product P);
}
