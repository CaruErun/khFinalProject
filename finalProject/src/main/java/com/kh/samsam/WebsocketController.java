package com.kh.samsam;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebsocketController {

    @MessageMapping("/send/message") 
    @SendTo("/chat/greetins")
    public String onReceivedMessage(String message) {
        return message;
    }
}