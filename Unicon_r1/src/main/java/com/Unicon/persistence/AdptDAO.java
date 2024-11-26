package com.Unicon.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.AnimalVaccineVO;
import com.Unicon.domain.ImageVO;

import lombok.extern.log4j.Log4j2;


@Repository("AdptDAO")
@Log4j2
public class AdptDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE = "com.Unicon.mapper.AdptMapper.";
	
	
	public void animalInsert(AnimalVO animalVO) {
		log.info("( •̀ ω •́ )✧ animalInsert() 실행");
		
		sqlSession.insert(NAMESPACE+"adptInsert", animalVO);
		for(ImageVO imageVO : animalVO.getAnimal_images()) {
			sqlSession.insert(NAMESPACE+"adptImageInsert", imageVO);
		}
		for(AnimalHealthVO healthVO : animalVO.getAnimal_healths()) {
			sqlSession.insert(NAMESPACE+"adptHealthInsert", healthVO);
		}
		for(AnimalVaccineVO vaccineVO : animalVO.getAnimal_vaccines()) {
			sqlSession.insert(NAMESPACE+"adptVaccineInsert", vaccineVO);
		}
		
	}
	
	
	
	
}
