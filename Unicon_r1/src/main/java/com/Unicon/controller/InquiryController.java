package com.Unicon.controller;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Controller
@RequestMapping(value = "/inquiry/*")
public class InquiryController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);

    @GetMapping("/inquiry")
    public String main() {
    	logger.debug("inquiry 메인 페이지 실행");
        return "inquiry/inquiry";  
    }
  
    @GetMapping("/adoption")
    public String adoption() {
    	logger.debug("adoption 메인 페이지 실행");
        return "inquiry/adoption";  
    }
  
    @GetMapping("/shop")
    public String shop() {
    	logger.debug("shop 메인 페이지 실행");
        return "inquiry/shop";  
    }
    
    @GetMapping("/community")
    public String community() {
    	logger.debug("community 메인 페이지 실행");
        return "inquiry/community";  
    }
    
    @GetMapping("/board")
    public String board() {
    	logger.debug("board 메인 페이지 실행");
        return "inquiry/board";  
    }
    
    @GetMapping("/history")
    public String history() {
    	logger.debug("history 메인 페이지 실행");
        return "inquiry/history";  
    }
    
    @GetMapping("/question")
    public String question() {
    	logger.debug("question 메인 페이지 실행");
        return "inquiry/question";  
    }
    
    @GetMapping("/write")
    public String write() {
    	logger.debug("write 메인 페이지 실행");
        return "inquiry/write";  
    }
    
    
    
    
    
} // InquiryController