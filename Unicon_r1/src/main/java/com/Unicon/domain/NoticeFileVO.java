package com.Unicon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeFileVO {
    private Long fileId;
    private Long noId;        
    private String originalName;   // 원본 파일명
    private String storedName;    // 저장된 파일명
    private String filePath;      // 파일 경로
    private Long fileSize;        // 파일 크기
    private String fileType;      // 썸네일, 본문
    private Date uploadDate;      // 업로드 일자
}
