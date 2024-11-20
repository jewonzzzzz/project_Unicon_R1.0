package com.Unicon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.InquiryVO;
import com.Unicon.service.InquiryService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@RestController

@RequestMapping(value = "/api")
@Api(tags = "문의게시판 API")
public class InquiryRestController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryRestController.class);

	@Autowired
	private InquiryService inquiryService;

	// 게시글 목록 조회
	@GetMapping(value = "/boards")	
	public List<InquiryVO> getAllInquiries() {
		return inquiryService.getAllInquiries(); // JSON 형식으로 반환
	}

} // InquiryController