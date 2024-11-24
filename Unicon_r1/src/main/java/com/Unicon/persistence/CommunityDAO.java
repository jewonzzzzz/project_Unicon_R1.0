package com.Unicon.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;

@Repository("CommunityDAO")
public class CommunityDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.Unicon.mapper.CommunityMapper.";
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAO.class);
	
	// 게시물 등록
	public void postInsert(PostVO postVO) {
		logger.info(" DAO - postInsert() 실행 ");
		
		sqlSession.insert(NAMESPACE+"postInsert", postVO);
		for(ImageVO imageVO : postVO.getPost_images()) {
			sqlSession.insert(NAMESPACE+"postImageInsert", imageVO);
		}
	} // postInsert()
	
}
