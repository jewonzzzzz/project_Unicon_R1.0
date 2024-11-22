package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	
	private String comment_id;			// 댓글 고유 아이디
	private String post_id;				// 게시글 아이디
	private String member_id;			// 유저아이디
	private String comment_content;		// 내용
	private Timestamp comment_date;		// 생성일자
	
}
