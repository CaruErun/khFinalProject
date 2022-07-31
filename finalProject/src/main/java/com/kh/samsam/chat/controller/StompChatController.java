package com.kh.samsam.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.kh.samsam.chat.model.vo.ChatMessageDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
// 메세지를 브로커
// 접두어 app이 있어서 이 컨트롤러로 옴
public class StompChatController {
	// 메세지를 보내기위한 템플릿 자바/스톰프에서 제공함
	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageDTO message){
        message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageDTO message){
    	template.convertAndSend("/topic/chat/room/" + message.getRoomId(), message);
    }
}
