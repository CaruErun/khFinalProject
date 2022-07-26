package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.product.model.dao.ProductDao;
import com.kh.samsam.product.model.vo.Bid;
import com.kh.samsam.product.model.vo.Postbox;
import com.kh.samsam.product.model.vo.Product;
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
	public int insertProductImages(ArrayList<ProductImages> list) {
		return productDao.insertProductImages(sqlSession,list);
	}
	
	
	@Override
	public int selectProListCount() {
		return productDao.selectProListCount(sqlSession);
	}



	@Override
	public ArrayList<Product> selectProductList(PageInfo pi) {
		return productDao.selectProductList(sqlSession,pi);
	}
	@Override
	public int increaseCount(int pNo) {
		// TODO Auto-generated method stub
		return productDao.increaseCount(sqlSession, pNo);
	}



	@Override
	public Product selectProduct(int pNo) {
		return productDao.selectProduct(sqlSession, pNo);
	}



	@Override
	public ArrayList<ProductImages> selectImgList(int pNo) {
		
		return productDao.selectImgList(sqlSession,pNo);
	}

	//=======================
	
	@Override
	public ArrayList<Product> selectList(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectList(sqlSession,pi,userId);
	}

	@Override
	public int postInsert(Postbox p) {
		// TODO Auto-generated method stub
		return productDao.postInsert(sqlSession,p);
	}

	@Override
	public ArrayList<Postbox> selectListPost(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListPost(sqlSession,pi,userId);
	}

	@Override
	public ArrayList<Bid> selectListAttend(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListAttend(sqlSession,pi,userId);
	}

	@Override
	public ArrayList<Bid> selectListBid(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListBid(sqlSession,pi,userId);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return productDao.selectListCount(sqlSession);
	}

	@Override
	public int selectListCountt() {
		// TODO Auto-generated method stub
		return productDao.selectListCountt(sqlSession);
	}

	
	

	//검색 전체 목록 => 옵션, 키워드
	@Override
	public List<Product> getSearchList(String searchType, String searchKeyword) {
		return productDao.getSearchList(sqlSession, searchType, searchKeyword);
	}

	//검색 레코드 갯수
	public int searchProListCount(String searchType, String searchKeyword) {
		return productDao.searchProListCount(sqlSession, searchType, searchKeyword);
		
	}
		
		
	//정렬 (with 검색)
	@Override
	public List<Product> filterList(String searchType, String searchKeyword, String sort) {
		return productDao.filterList(sqlSession, searchType, searchKeyword, sort);
	}

	//정렬 (without 검색)
	@Override
	public List<Product> filterListNoS(String sort) {
		return productDao.filterListNoS(sqlSession, sort);
	}
	

	
}
