package com.Unicon.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.PostVO;
import com.Unicon.persistence.CommunityDAO;

@Service("CommunityService")
public class CommunityService {
	
	@Inject
	CommunityDAO communityDAO;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityService.class);
	
	// 게시물 등록
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void postInsert(PostVO postVO) {
		logger.info(" Service - postInsert() 실행");
		communityDAO.postInsert(postVO);
	} // postInsert()
	
}
