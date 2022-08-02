package com.kh.samsam.chat.model.vo;

import lombok.Data;

@Data
public class ChatMessageDTO {
	private String roomId;
	private String writer;
	private String message;
}

