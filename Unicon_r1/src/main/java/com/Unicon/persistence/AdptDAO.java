package com.Unicon.persistence;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.AdptHealthVO;
import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AdptVaccineVO;
import com.Unicon.domain.ImageVO;

import lombok.extern.log4j.Log4j;

@Repository("AdptDAO")
@Log4j
public class AdptDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE = "com.Unicon.mapper.AdptMapper.";
	
	
	public void adptInsert(AdptVO adptVO) {
		
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		
		sqlSession.insert(NAMESPACE+"adptInsert", adptVO);
		for(ImageVO imageVO : adptVO.getAdpt_images()) {
			sqlSession.insert(NAMESPACE+"adptImageInsert", imageVO);
		}
		for(AdptHealthVO healthVO : adptVO.getAdpt_healths()) {
			sqlSession.insert(NAMESPACE+"adptHealthInsert", healthVO);
		}
		for(AdptVaccineVO vaccineVO : adptVO.getAdpt_vaccines()) {
			sqlSession.insert(NAMESPACE+"adptVaccineInsert", vaccineVO);
		}
		
	}
	
	
	
	
}
