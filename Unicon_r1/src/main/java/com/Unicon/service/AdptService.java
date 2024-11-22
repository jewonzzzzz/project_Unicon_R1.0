package com.Unicon.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.AdptVO;
import com.Unicon.persistence.AdptDAO;

import lombok.extern.log4j.Log4j;

@Service("AdptService")
@Log4j
public class AdptService {
	
	@Inject
	AdptDAO adptDAO;
	
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void adptInsert(AdptVO adptVO) {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		adptDAO.adptInsert(adptVO);
	}

}
