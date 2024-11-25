package com.Unicon.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.service.CategoryDataService;

import lombok.extern.log4j.Log4j;


@RestController
@RequestMapping(value = "/petData")
@Log4j
public class PetDataRestController {
	
	@Inject
	CategoryDataService cService;
	
	@GetMapping("/petType")
	public ResponseEntity<List<CategoryDataVO>> petType() throws Exception {
		log.info("( •̀ ω •́ )✧ petType() 실행");
		List<CategoryDataVO> petTypeAllList = cService.petTypeAll();
		if(petTypeAllList == null) {
			return new ResponseEntity<List<CategoryDataVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<List<CategoryDataVO>>(petTypeAllList, HttpStatus.OK);
		}
	}
	
	@GetMapping("/petType/{num}")
	public ResponseEntity<List<CategoryDataVO>> dogType(@PathVariable("num") int num) {
		log.info("( •̀ ω •́ )✧ dogType() 실행");
		log.info("( •̀ ω •́ )✧ num : " + num);
		List<CategoryDataVO> petTypeDetailList = cService.petTypeDetail(num);
		if(petTypeDetailList != null) {
			return new ResponseEntity<List<CategoryDataVO>>(petTypeDetailList, HttpStatus.OK);
		} else {
			return new ResponseEntity<List<CategoryDataVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
}
