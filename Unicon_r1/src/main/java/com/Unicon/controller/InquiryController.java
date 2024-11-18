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
    public String mainTest() {
    	logger.debug("inquiry 메인 페이지 실행");
        return "inquiry/inquiry";  
    }
  
    
    
    
    
    
    
} // InquiryController