package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	
	private String post_id;			// 게시글 아이디
	private String member_id;		// 유저아이디
	private String post_title;		// 제목
	private String post_content;	// 내용
	private Timestamp post_date;	// 생성 일자
	private String post_type;		// 게시물 종류
	private int pet_code;			// 동물분류코드
	private String pet_etc_breed;	// 기타동물품종
	private String post_pet_place;	// 실종/발견 장소
	private String post_pet_date;	// 실종/발견 일자
	
}
