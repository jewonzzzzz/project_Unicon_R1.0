package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/store/*")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@RequestMapping( value = "/main" , method=RequestMethod.GET)
	public String main() {
		logger.info("main 실행");
		logger.info(" /store/main.jsp 뷰페이지 실행");
		
		return "/store/main";
	}
	
	
	@RequestMapping( value="/products/list" , method =RequestMethod.GET )
	public void productsList() {
		logger.info("products/list 실행");
		
	}
	
}
