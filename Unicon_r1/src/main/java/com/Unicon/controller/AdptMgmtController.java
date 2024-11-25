package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping(value = "/adptmgmt/*")
@Log4j2
public class AdptMgmtController {
	
	@GetMapping(value = "/main")
	public void adptmgmtMain() throws Exception {
		log.info("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/writings")
	public String adptmgmtInsert() throws Exception {
		log.info("( •̀ ω •́ )✧ adptmgmtInsert() 실행");
		return "/adptmgmt/writings/insert";
	}
	
}
