package com.kh.samsam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
		 @GetMapping("/chat")
		   public String chatGET(){
		        log.info("@ChatController, chat GET()");
		        return "chat";
		    }
		 @GetMapping("/chatttt")
		   public String chatGET(){
		        log.info("@ChatController, chat GET()");
		        return "chat";
		    }
		 @GetMapping("/chatttttt")
		   public String chatGET(){
		        log.info("@ChatController, chat GET()");
		        return "chat";
		    }
		 dfsfdsdf
}
