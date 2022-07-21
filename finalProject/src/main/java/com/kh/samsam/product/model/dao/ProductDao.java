package com.kh.samsam.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.product.model.vo.Bid;
import com.kh.samsam.product.model.vo.Postbox;
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

	
	public int selectProListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.selectProListCount");
	}

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi) {
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
			
			RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList",null,rowBounds);
	}


	
	//검색
	public List<Product> getSearchList(SqlSessionTemplate sqlSession,Product p) {
		return sqlSession.selectList("productMapper.getSearchList",p);
	}
	
	
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", userId, rowBounds);
	}

	public int postInsert(SqlSessionTemplate sqlSession, Postbox p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("productMapper.postInsert",p);
	}

	public ArrayList<Postbox> selectListPost(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectListPost", userId, rowBounds);
	}

	public ArrayList<Bid> selectListAttend(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectListAttend", userId, rowBounds);
	}

	public ArrayList<Bid> selectListBid(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectListBid", userId, rowBounds);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCount");
	}

	public int selectListCountt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCountt");
	}



	
	
	
}
