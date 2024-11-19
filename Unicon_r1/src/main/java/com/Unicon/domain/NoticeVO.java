package com.Unicon.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private Long noId;
    private int noBno;
    private String noTitle;
    private String noContent;
    private String noWriter;
    private Date noRegDate;
    private Date noModDate;
    private String noImage;
    private String noThumb;
    private String noCategory;    // 안내사항, 이벤트, 센터소식
    private boolean important;  // 중요 공지사항 여부   
    private int temporary;  // 임시저장
    private String visibility;  // 공개범위
    private String status;      // 삭제여부
    private int viewCount;
    private boolean noEmail;  // 이메일 알림전송
}
