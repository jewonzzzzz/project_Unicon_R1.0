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
import org.springframework.web.bind.annotation.RequestBody;
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
	// JSON 데이터를 처리하는 POST 요청
	@PostMapping("/submit")
	public ResponseEntity<String> submitInquiry(@RequestBody InquiryVO inquiry) {
	    try {
	        // Inquiry 객체 처리
	    	  // Inquiry 객체의 필드 출력 (디버깅용)
	        System.out.println("Received Inquiry: " + inquiry);
	        inquiryService.insertInquiry(inquiry);
	        return new ResponseEntity<>("문의가 성공적으로 등록되었습니다.", HttpStatus.CREATED);
	    } catch (Exception e) {
	        logger.error("Error processing inquiry submission", e);
	        return new ResponseEntity<>("문의 등록 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	// 파일을 처리하는 POST 요청
	@PostMapping("/submitFile")
	public ResponseEntity<String> submitFile(@RequestParam("file") MultipartFile file) {
	    try {
	        // 파일 처리 로직
	        inquiryService.saveFile(file);
	        return new ResponseEntity<>("파일이 성공적으로 업로드되었습니다.", HttpStatus.CREATED);
	    } catch (Exception e) {
	        logger.error("Error processing file upload", e);
	        return new ResponseEntity<>("파일 업로드 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
} // InquiryController