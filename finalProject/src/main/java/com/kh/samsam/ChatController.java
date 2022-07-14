package com.kh.samsam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
    
    @GetMapping("/chatt")
    public String chatGET(){

        log.info("@ChatController, chat GET()");
        System.out.println("123");
        return "chat";
    }
    @GetMapping("/chattt")
    public String chatGET(){

        log.info("@ChatController, chat GET()");
        System.out.println("123");
        return "chat";
    }
}
