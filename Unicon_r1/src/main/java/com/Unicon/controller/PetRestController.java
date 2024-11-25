package com.Unicon.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.PetDataVO;

import lombok.extern.log4j.Log4j;

@RestController(value = "/petData/*")
@Log4j
public class PetRestController {
	
	
	@GetMapping("/petType")
	public ResponseEntity<List<PetDataVO>> petType() {
		log.info("( •̀ ω •́ )✧ petType() 실행");
		return null;
	}
	
	@GetMapping("/petType/dog")
	public ResponseEntity<List<PetDataVO>> dogType() {
		log.info("( •̀ ω •́ )✧ dogType() 실행");
		return null;
	}
	
	@GetMapping("/petType/cat")
	public ResponseEntity<List<PetDataVO>> catType() {
		log.info("( •̀ ω •́ )✧ catType() 실행");
		return null;
	}
	
	@GetMapping("/petType/etc")
	public ResponseEntity<List<PetDataVO>> etcType() {
		log.info("( •̀ ω •́ )✧ etcType() 실행");
		return null;
	}
	
	
}
