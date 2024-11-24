package com.Unicon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Unicon.persistence.CommunityDAO;

@Service("CommunityService")
public class CommunityService {
	
	@Inject
	CommunityDAO communityDAO;
	
}
