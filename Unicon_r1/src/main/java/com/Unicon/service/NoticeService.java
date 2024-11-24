package com.Unicon.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeVO;

public interface NoticeService {
	// 공지사항 등록
    void registerNotice(NoticeVO noVO) throws Exception;
    
    // 공지사항 목록 조회
    Map<String, Object> getNoticeList(int page, int size, String category, String keyword) throws Exception;
    
    // 공지사항 상세 조회
    NoticeVO getNotice(Long noId) throws Exception;
    
    // 이전글, 다음글
    NoticeVO getPrevNotice(Long noId) throws Exception;
    
    NoticeVO getNextNotice(Long noId) throws Exception;
    
    // 공지사항 수정
    void updateNotice(NoticeVO noVO) throws Exception;
    
    // 공지사항 삭제
    void deleteNotice(Long noId) throws Exception;
}

