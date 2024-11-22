package com.Unicon.domain;

import lombok.Data;

@Data
public class ImageVO {
	
	private String image_id;		// 이미지 id
	private String image_type;		// 이미지 종류
	private int image_sequence;		// 이미지 순서
	private String image_src;		// 이미지 경로
	
}

