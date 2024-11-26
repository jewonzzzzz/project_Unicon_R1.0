package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.service.CategoryDataService;



@RestController
@RequestMapping("/store")
public class StoreRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRestController.class);
	
	
	@Inject 
	private CategoryDataService cService;
	
	
	@RequestMapping(value = "/category/{value}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryDataVO>> sscategoryDataGET(@PathVariable("value") String value) {
		logger.info("categoryDataGET(value) 호출 ");
		
		List<CategoryDataVO> CategoryDetailDataList = cService.petProductsCategoryDetail(value);
		
		if(CategoryDetailDataList == null) {
			return new ResponseEntity<List<CategoryDataVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<List<CategoryDataVO>>(CategoryDetailDataList, HttpStatus.OK);
		}
		
	}
	
	
	
}
