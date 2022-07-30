package com.kh.samsam.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.ProLike;
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
	public int selectListCount(String userId) {
		// TODO Auto-generated method stub
		return productDao.selectListCount(sqlSession,userId);
	}

	@Override
	public int selectListCountt(String userId) {
		// TODO Auto-generated method stub
		return productDao.selectListCountt(sqlSession, userId);
	}
	
	@Override
	public int selectListCounttt(String userId) {
		// TODO Auto-generated method stub
		return productDao.selectListCounttt(sqlSession, userId);
	}
	
	@Override
	public int selectListCountttt(String userId) {
		// TODO Auto-generated method stub
		return productDao.selectListCountttt(sqlSession, userId);
	}
	
	
	@Override
	public int selectListCounttttt(String userId) {
		// TODO Auto-generated method stub
		return productDao.selectListCounttttt(sqlSession,userId);
	}
	

	@Override
	public ArrayList<Postbox> selectListnPost(String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		return productDao.selectListnPost(sqlSession,pi,userId);
	}
	
	//검색
	@Override
	public List<Product> getSearchList(Product p) {
		
		return productDao.getSearchList(sqlSession,p);
	}
	
	@Override
	public int addWishlist(ProLike l) {
		// TODO Auto-generated method stub
		return productDao.addWishlist(sqlSession,l);
	}

	@Override
	public int removeWishlist(ProLike l) {
		// TODO Auto-generated method stub
		return productDao.removeWishlist(sqlSession, l);
	}

	
	//판매현황 삭제
	@Override
	public int deleteSale(String[] chArr) {
		// TODO Auto-generated method stub
		return productDao.deleteSale(sqlSession, chArr);
	}

	//운송장 조회 삭제
	@Override
	public int deletePost(String[] chArr2) {
		// TODO Auto-generated method stub
		return productDao.deletePost(sqlSession,chArr2);
	}

	//응찰현황 삭제
	@Override
	public int deleteBid(String[] chArr3) {
		// TODO Auto-generated method stub
		return productDao.deleteBid(sqlSession,chArr3);
	}

	//판매 운송장 조회
	@Override
	public int nPostDelete(String[] chArr4) {
		// TODO Auto-generated method stub
		return productDao.nPostDelete(sqlSession,chArr4);
	}




}
