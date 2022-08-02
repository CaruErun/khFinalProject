package com.kh.samsam.chat.model.vo;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatRoomDTO {
    private String roomId;
    private String name;
    private int proNo;
    private int chatRoomNo;
}
