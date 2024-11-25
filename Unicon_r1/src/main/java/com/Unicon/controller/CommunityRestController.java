package com.Unicon.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.PostVO;
import com.Unicon.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	@Inject
	CommunityService communityService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityRestController.class);
	
	/*
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public ResponseEntity<String> insertPost(PostVO postVO){
		
		logger.info(" 커뮤니티REST컨트롤러 - insertPost() 실행 ");
		logger.info("postVO : {}",postVO);
		
		ResponseEntity<String> respEntity = null;
		try {
			logger.info(" 커뮤니티Service postInsert() 호출 ");
			communityService.postInsert(postVO);
			respEntity = new ResponseEntity<String>("ADD_Success",HttpStatus.OK);
		} catch (Exception e) {
			respEntity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return respEntity;
		
	} // insertPost()
	*/
	
	
} // CommunityRestController
