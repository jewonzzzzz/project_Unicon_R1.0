package com.Unicon.controller;

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
    public ResponseEntity<String> categoryDataGET(@PathVariable("value") String value) {
		logger.info("listAllBoard() 호출 ");
		
		ResponseEntity<String> respEntity = null;
		try {
			CategoryDataVO CategoryDataist = cService.(bno);
			respEntity = new ResponseEntity<CategoryDataVO>(CategoryDataist, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
		}	
		
		return respEntity;
    }
	
	
	
}
