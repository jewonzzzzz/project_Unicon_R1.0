package com.Unicon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Unicon.persistence.AdptDAO;

import lombok.extern.log4j.Log4j;

@Service("AdptService")
@Log4j
public class AdptService {
	
	@Inject
	AdptDAO adptDAO;
	
	public void adptInsert() {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		adptDAO.adptInsert();
	}

}
