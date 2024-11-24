package com.Unicon.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;

public interface NoticeFileService {
	// 파일 업로드 처리
    NoticeFileVO uploadFile(MultipartFile file, String fileType) throws Exception;
    
    // 파일 정보 저장
    void saveFile(NoticeFileVO file) throws Exception;
    
    // 공지사항 ID로 파일 목록 조회
    List<NoticeFileVO> getFilesByNoticeId(Long noId) throws Exception;
    
    // 공지사항 ID와 파일 타입으로 파일 삭제
    void deleteFilesByType(Long noticeId, String fileType) throws Exception;
    
    // 공지사항 ID로 모든 파일 삭제
    void deleteFilesByNoticeId(Long noticeId) throws Exception;
}
