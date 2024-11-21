package com.Unicon.controller;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.service.AdptService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	AdptService aService;
	
	@PostMapping("")
	public ResponseEntity<String> adptInsert() {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		
		return null;
	}
	
}
