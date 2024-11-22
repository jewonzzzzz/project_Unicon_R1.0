package com.Unicon.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryVO;
import com.Unicon.service.InquiryService;

import io.swagger.annotations.Api;


@RestController
@RequestMapping(value = "/api")
@Api(tags = "문의게시판 API")
public class InquiryRestController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryRestController.class);

	@Autowired
	private InquiryService inquiryService;
	
	

	// 게시글 목록 조회
	@GetMapping
	@ResponseBody
	public List<InquiryVO> getAllInquiries() {
		return inquiryService.getAllInquiries(); // JSON 형식으로 반환
	}
	
	@GetMapping(value = "/boards")
    public ResponseEntity<Map<String, Object>> getBoards(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "size", defaultValue = "10") int size
    ) {
        Map<String, Object> response = inquiryService.getPagedBoards(page, size);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
	
	@PostMapping("/submit")
	public ResponseEntity<String> submitInquiry(
	        @RequestParam("inquiryCategory") String inquiryCategory,
	        @RequestParam("email") String email,
	        @RequestParam("emailDomain") String emailDomain,
	        @RequestParam("phone") String phone,
	        @RequestParam("title") String title,
	        @RequestParam("content") String content,
	        @RequestParam(value = "file", required = false) MultipartFile file) {

	    try {
	        // 로그 추가
	        logger.debug("Received Inquiry - Category: {}, Email: {}, Phone: {}, Title: {}", 
	                    inquiryCategory, email + "@" + emailDomain);

	        InquiryVO inquiry = new InquiryVO();
	        inquiry.setIstatus(inquiryCategory);
	        inquiry.setEmail(email + "@" + emailDomain);
	        inquiry.setPhone(Integer.parseInt(phone)); 
	        inquiry.setTitle(title);
	        inquiry.setContent(content);

	        if (file != null && !file.isEmpty()) {
	            inquiry.setAttachment(file.getOriginalFilename());
	            inquiryService.saveFile(file);
	        }

	        inquiryService.insertInquiry(inquiry);
	        return new ResponseEntity<>("문의가 성공적으로 등록되었습니다.", HttpStatus.CREATED);

	    } catch (Exception e) {
	        e.printStackTrace();
	        logger.error("Error processing inquiry submission", e);
	        return new ResponseEntity<>("문의 등록 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	
} // InquiryController