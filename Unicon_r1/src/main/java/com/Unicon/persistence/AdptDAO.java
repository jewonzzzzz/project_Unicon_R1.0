package com.Unicon.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;

@Repository("AdptDAO")
@Log4j
public class AdptDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE = "com.Unicon.mapper.AdptMapper.";
	
	public void adptInsert() {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		
	}
	
	
	
	
}
