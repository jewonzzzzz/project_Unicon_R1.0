package com.Unicon.persistence;

import java.util.List;

import com.Unicon.domain.NoticeFileVO;

public interface NoticeFileDAO {
	void insertFile(NoticeFileVO file) throws Exception;
    void updateFile(NoticeFileVO file) throws Exception;
    void deleteFile(Long fileId) throws Exception;
    NoticeFileVO selectFile(Long fileId) throws Exception;
    List<NoticeFileVO> selectFilesByNoticeId(Long noId) throws Exception;
    List<NoticeFileVO> selectFilesByType(Long noId, String fileType) throws Exception;
    void deleteFilesByNoticeId(Long noId) throws Exception;
    void deleteFilesByType(Long noId, String fileType) throws Exception;
}
