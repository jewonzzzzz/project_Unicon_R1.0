package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
//	//템플릿 테스트
//	@GetMapping("/shop")
//	public String mainTest2() {
//		
//		return "main/template";
//	}
	
//	//템플릿 테스트
//	@GetMapping("/test")
//	public String mainTest3() {
//		
//		return "main/test";
//	}
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	// http://localhost:8088/community/listAll
	@GetMapping("listAll")
	public String readCommunityAll() {
		
		logger.info(" community 메인페이지(전체 글) 실행 ");
		
		return "community/community";
	}
	
	// http://localhost:8088/community/insert
	@GetMapping("insert")
	public String insertCommunity() {
		
		logger.info(" community 등록페이지 실행 ");
		
		return "community/insert";
	}
	
} //controller
