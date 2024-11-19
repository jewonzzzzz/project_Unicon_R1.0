package com.Unicon.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping(value = "/inquiry")
public class InquiryRestController {

private static final Logger logger = LoggerFactory.getLogger(InquiryRestController.class);

    @GetMapping("/")
    public String mainTest() {
    	
        return "inquiry / 테스트";  // JSON 형식으로 응답: {"inquiry": "inquiry"}
    }
    @GetMapping("/data")
    public String selectData() {
        return "{데이터 테스트}";
    }
    
    
    
    
    
    
} // InquiryController