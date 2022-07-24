package com.kh.samsam.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samsam.chat.model.dao.chatDao;
import com.kh.samsam.chat.model.vo.ChatRoomDTO;

@Service
public class chatService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private chatDao chatDao;
	
	public ArrayList<ChatRoomDTO> chatCheck(String userId){
		return chatDao.chatCheck(sqlSession, userId);
		
	}

	public ArrayList<ChatRoomDTO> sellerCheck(String userId) {
		return chatDao.sellerCheck(sqlSession,userId);
	}
	
	
}
