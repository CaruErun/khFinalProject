package com.kh.samsam.product.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductImages;

public interface ProductService {
	
	int insertProduct(Product p);
	ArrayList<Category> selectCategoryList(int categoryNo);
	void insertProductImages(ArrayList<ProductImages> list);
}
