package com.Unicon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.InquiryVO;
import com.Unicon.service.InquiryServiceImpl;

import lombok.extern.log4j.Log4j2;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	private static final Logger logger = LoggerFactory.getLogger(InquiryDAOImpl.class);

	@Autowired
	private SqlSession sqlSession; 

	private static final String NAMESPACE = "com.unicon.mapper.InquiryMapper";

	@Override
	public List<InquiryVO> getAllInquiries() {
		logger.debug("문의 게시판 DAO 조회 실행");
		return sqlSession.selectList(NAMESPACE + ".getAllInquiries"); 
	}
}
