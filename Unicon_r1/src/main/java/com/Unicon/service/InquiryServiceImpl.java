package com.Unicon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.Unicon.controller.NoticeController;
import com.Unicon.domain.InquiryVO;
import com.Unicon.persistence.InquiryDAO;


@Service
public class InquiryServiceImpl implements InquiryService {

	private static final Logger logger = LoggerFactory.getLogger(InquiryServiceImpl.class);
	
	private InquiryDAO inquiryDAO; 

	// 게시글 목록 조회
	public List<InquiryVO> getAllInquiries() {
		return inquiryDAO.getAllInquiries(); // DAO 호출
	}

}
