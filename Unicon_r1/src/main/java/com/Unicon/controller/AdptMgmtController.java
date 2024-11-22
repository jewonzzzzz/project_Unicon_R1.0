package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value = "/adptmgmt**")
@Log4j
public class AdptMgmtController {
	
	@GetMapping(value = "")
	public String main() throws Exception {
		log.info("( •̀ ω •́ )✧ main() 실행");
		return "/adptmgmt/adptmgmt_main";
	}
}
