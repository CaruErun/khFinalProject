package com.kh.samsam.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int insertProductImages(SqlSessionTemplate sqlSession, ArrayList<ProductImages> list) {
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
	public int increaseCount(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.update("productMapper.increaseCount",pNo);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("productMapper.selectProduct",pNo);
	}

	public ArrayList<ProductImages> selectImgList(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectImgList",pNo);
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



	
	//?????? ?????? ?????? => ??????, ?????????
	public List<Product> getSearchList(SqlSessionTemplate sqlSession, String searchType, String searchKeyword) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		return sqlSession.selectList("productMapper.getSearchList",map);
	}

	
	//?????? ????????? ??????
	public int searchProListCount(SqlSessionTemplate sqlSession, String searchType, String searchKeyword) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		return sqlSession.selectOne("productMapper.searchProListCount",map);
	}
	
	
	
	//?????? (with ??????)
	public List<Product> filterList(SqlSessionTemplate sqlSession, String searchType, String searchKeyword, String sort) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		map.put("sort", sort);
		
		return sqlSession.selectList("productMapper.filterList", map);
	}

	//?????? (without ??????)
	public List<Product> filterListNoS(SqlSessionTemplate sqlSession, String sort) {
		
		return sqlSession.selectList("productMapper.filterListNoS", sort);
	}

	
	
	
}
