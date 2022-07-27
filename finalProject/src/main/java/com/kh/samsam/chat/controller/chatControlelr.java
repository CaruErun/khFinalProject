package com.kh.samsam.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.samsam.chat.model.service.chatService;
import com.kh.samsam.chat.model.vo.ChatRoomDTO;

@Controller
public class chatControlelr {
	@Autowired
	private chatService chatService;
	
	@RequestMapping(value = "ajaxBid.ch", produces = "application/json; charset=UTF-8" )
	@ResponseBody
	public String ajaxChat(String userId) {
		ArrayList<ChatRoomDTO> chatList = chatService.chatCheck(userId);
		ArrayList<ChatRoomDTO> sellList = chatService.sellerCheck(userId);
		Map<String, Object> list = new HashMap<>();
		list.put("chatList", chatList);
		list.put("sellList", sellList);
		return new Gson().toJson(list);
	}
	@RequestMapping("chatenter.ch")
	public String chatEnter(ChatRoomDTO chat,Model model) {
		chat.setRoomId("123");
		model.addAttribute("chat", chat);
		
		return "chat/room";
		
	}
}
