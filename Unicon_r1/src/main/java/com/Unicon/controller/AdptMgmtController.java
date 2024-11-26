package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping(value = "/adptmgmt/*")
public class AdptMgmtController {
	
	@GetMapping(value = "/main")
	public void adptmgmtMain() throws Exception {
		log.info("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/animals")
	public String animalAdd() throws Exception {
		log.info("( •̀ ω •́ )✧ animalAdd() 실행");
		return "/adptmgmt/animals/insert";
	}
	
}
