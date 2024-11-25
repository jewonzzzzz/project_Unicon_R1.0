package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardVO;



@RestController
@RequestMapping("/store")
public class StoreRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRestController.class);
	
	
	@RequestMapping(value = "/")
	public void categoryDataGET() {
		
	}
	
	@RequestMapping(value = "/category/{value}", method = RequestMethod.GET)
    public ResponseEntity<String> categoryDataGET(@PathVariable("value") String value) {
		logger.info("listAllBoard() 호출 ");
		
		// ResponseEntity<> respEntity = null;
//		try {
//			BoardVO boardList = bService.read(bno);
			respEntity = new ResponseEntity<BoardVO>(boardList, HttpStatus.OK);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}	
		
		return respEntity;
    }
	
	
	
}
