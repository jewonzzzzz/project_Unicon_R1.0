package com.Unicon.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeVO;
import com.Unicon.service.NoticeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class NoticeController {
	
	private static final Logger logger 
					= LoggerFactory.getLogger(NoticeController.class);
    
    @Inject
    private NoticeService noService;
    
    // 관리자용 API (Admin API)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
    @ApiOperation(value = "관리자 공지사항 등록", notes = "관리자 권한으로 공지사항을 등록합니다")
    public ResponseEntity<String> registerNotice(
    		@RequestPart(value = "notice", required = true) NoticeVO noVO,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
            @RequestPart(value = "file", required = false) MultipartFile[] files) {
        try {
            noService.registerNotice(noVO, thumbnail, files);
            return new ResponseEntity<>("등록 성공", HttpStatus.CREATED);
        } catch (Exception e) {
            logger.info("공지사항 등록 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/notice/{noId}", method = RequestMethod.PUT)
    @ApiOperation(value = "관리자 공지사항 수정", notes = "관리자 권한으로 공지사항을 수정합니다")
    public ResponseEntity<String> updateNotice(
            @PathVariable("noId") Long noId,
            @RequestPart(value = "notice") NoticeVO noVO,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
            @RequestPart(value = "file", required = false) MultipartFile[] files) {
        try {
            noVO.setNoId(noId);
            noService.updateNotice(noVO, thumbnail, files);
            return new ResponseEntity<>("수정 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.info("공지사항 수정 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/notice/{noId}", method = RequestMethod.DELETE)
    @ApiOperation(value = "관리자 공지사항 삭제", notes = "관리자 권한으로 공지사항을 삭제합니다")
    public ResponseEntity<String> deleteNotice(@PathVariable("noId") Long noId) {
        try {
            noService.deleteNotice(noId);
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.info("공지사항 삭제 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    // 공통 API (Common API) - 관리자/사용자 모두 접근 가능
    @RequestMapping(value = "/notice", method = RequestMethod.GET)
    @ApiOperation(value = "공지사항 목록 조회", notes = "페이징 처리된 공지사항 목록을 조회합니다")
    public ResponseEntity<Map<String, Object>> getNoticeList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "12") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword) {
        try {
            Map<String, Object> result = noService.getNoticeList(page, size, category, keyword);
            return new ResponseEntity<>(result, HttpStatus.OK);
        } catch (Exception e) {
            logger.info("공지사항 목록 조회 실패", e);
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/notice/{noId}", method = RequestMethod.GET)
    @ApiOperation(value = "공지사항 상세 조회", notes = "공지사항 상세 정보를 조회합니다")
    public ResponseEntity<NoticeVO> getNotice(@PathVariable("noId") Long noId) {
        try {
            NoticeVO notice = noService.getNotice(noId);
            return new ResponseEntity<>(notice, HttpStatus.OK);
        } catch (Exception e) {
            logger.info("공지사항 상세 조회 실패", e);
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}