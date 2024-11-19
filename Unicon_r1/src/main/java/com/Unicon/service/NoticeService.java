package com.Unicon.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeVO;

public interface NoticeService {
	// 공지사항 등록
    void registerNotice(NoticeVO noticeVO, MultipartFile thumbnail, MultipartFile[] contentFiles) throws Exception;
    
    // 공지사항 수정
    void updateNotice(NoticeVO noticeVO, MultipartFile thumbnail, MultipartFile[] contentFiles) throws Exception;
    
    // 공지사항 삭제
    void deleteNotice(Long noticeId) throws Exception;
    
    // 공지사항 목록조회
    Map<String, Object> getNoticeList(int page, int size, String category, String keyword) throws Exception;
    
    // 공지사항 상세조회
    NoticeVO getNotice(Long noticeId) throws Exception;
}

