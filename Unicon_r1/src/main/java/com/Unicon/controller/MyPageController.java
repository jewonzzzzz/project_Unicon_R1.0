package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@GetMapping(value = "/profile")
	public String Mypage() {
		
		
		return "/mypage/profile";
	}
	
}
