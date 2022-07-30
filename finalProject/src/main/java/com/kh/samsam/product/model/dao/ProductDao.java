package com.kh.samsam.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.ProLike;
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

	public int selectListCount(SqlSessionTemplate sqlSession,String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCount",userId);
	}

	public int selectListCountt(SqlSessionTemplate sqlSession,String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCountt",userId);
	}
	
	public int selectListCounttt(SqlSessionTemplate sqlSession,String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCounttt",userId);
	}
	
	public int selectListCountttt(SqlSessionTemplate sqlSession,String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCountttt",userId);
	}


	public int selectListCounttttt(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productMapper.selectListCountttt",userId);
	}

	public ArrayList<Postbox> selectListnPost(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectListnPost", userId, rowBounds);
	}

	
	//검색
	public List<Product> getSearchList(SqlSessionTemplate sqlSession,Product p) {
		return sqlSession.selectList("productMapper.getSearchList",p);
	}
	
	//찜 추가
	public int addWishlist(SqlSessionTemplate sqlSession, ProLike l) {
		// TODO Auto-generated method stub
		return sqlSession.insert("productMapper.addWishlist", l);
	}

	//찜 삭제
	public int removeWishlist(SqlSessionTemplate sqlSession, ProLike l) {
		// TODO Auto-generated method stub
		return sqlSession.delete("productMapper.removeWishlist", l);
	}
	
	
	//판매현황 삭제
	public int deleteSale(SqlSessionTemplate sqlSession, String[] chArr) {
		// TODO Auto-generated method stub
		int result =0;
		
		for(int i=0; i<chArr.length; i++) {
			String ch = chArr[i];
			result+=sqlSession.update("productMapper.deleteSale", ch);
			
		}
		return result;
	}

	//운송장 조회 삭제
	public int deletePost(SqlSessionTemplate sqlSession, String[] chArr2) {
		// TODO Auto-generated method stub
		int result2 =0;
		
		for(int i=0; i<chArr2.length; i++) {
			String ch2 = chArr2[i];
			result2+=sqlSession.update("productMapper.deletePost", ch2);
			
		}
		return result2;
	}

	//낙찰현황 삭제
	public int deleteBid(SqlSessionTemplate sqlSession, String[] chArr3) {
		// TODO Auto-generated method stub
		int result3 =0;
		
		for(int i=0; i<chArr3.length; i++) {
			String ch3 = chArr3[i];
			result3+=sqlSession.update("productMapper.deleteBid", ch3);
			
		}
		return result3;
	}
	
	
	//판매 운송장 조회 삭제
	public int nPostDelete(SqlSessionTemplate sqlSession, String[] chArr4) {
		// TODO Auto-generated method stub
		int result4 =0;
		
		for(int i=0; i<chArr4.length; i++) {
			String ch4 = chArr4[i];
			result4+=sqlSession.update("productMapper.nPostDelete", ch4);
			
		}
		return result4;
	}


	
	
	
}
