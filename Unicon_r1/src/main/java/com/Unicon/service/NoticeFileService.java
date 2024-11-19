package com.Unicon.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;

public interface NoticeFileService {
	NoticeFileVO uploadFile(MultipartFile file, String fileType) throws Exception;
    void deleteFile(Long fileId) throws Exception;
    List<NoticeFileVO> getFilesByNoticeId(Long noticeId) throws Exception;
}
