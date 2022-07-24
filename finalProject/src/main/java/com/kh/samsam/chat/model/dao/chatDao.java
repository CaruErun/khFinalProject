package com.kh.samsam.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.samsam.chat.model.vo.ChatRoomDTO;

@Repository
public class chatDao {
	public ArrayList<ChatRoomDTO> chatCheck(SqlSession sqlSession, String userId){
		return (ArrayList)sqlSession.selectList("chatMapper.chatCheck",userId);
	}

	public ArrayList<ChatRoomDTO> sellerCheck(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("chatMapper.sellerCheck",userId);
	}
}
