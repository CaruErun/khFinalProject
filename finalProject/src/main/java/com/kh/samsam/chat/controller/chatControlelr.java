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
import com.kh.samsam.chat.model.vo.ChatRoomDTO;

@Controller
public class chatControlelr {
	
	@RequestMapping("chatenter.ch")
	public String chatEnter(ChatRoomDTO chat,Model model) {
		model.addAttribute("chat", chat);
		
		return "chat/room";
		
	}
}
