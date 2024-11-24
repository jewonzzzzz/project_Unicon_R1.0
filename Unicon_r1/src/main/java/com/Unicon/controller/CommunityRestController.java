package com.Unicon.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	@Inject
	CommunityService communityService;
	
	
	
}
