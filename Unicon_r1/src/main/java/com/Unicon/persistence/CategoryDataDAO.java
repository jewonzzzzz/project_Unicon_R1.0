package com.Unicon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CategoryDataVO;

import lombok.extern.log4j.Log4j2;

@Repository(value = "CategoryDataDAO")
@Log4j2
public class CategoryDataDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.Unicon.mapper.categoryDataMapper.";
	
	public List<CategoryDataVO> petTypeAll() {
		log.info("( •̀ ω •́ )✧ petTypeAll() 실행");
		return sqlSession.selectList(NAMESPACE+"petTypeAll");
	}
	
	public List<CategoryDataVO> petTypeDetail(int num) {
		log.info("( •̀ ω •́ )✧ petTypeDetail() 실행");
		return sqlSession.selectList(NAMESPACE+"petTypeDetail", num);
	}
	
	
	
}
