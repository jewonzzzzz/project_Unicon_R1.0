package com.Unicon.domain;

import lombok.Data;

@Data
public class MyPetVO {
	
	private String pet_id;			// 반려동물 id
	private String pet_name;		// 반려동물 이름
	private int pet_code;			// 반려동물 분류코드
	private String pet_etc_breed;	// 기타동물품종
	private String pet_gender;		// 반려동물 성별
	private String pet_neuter;		// 중성화 여부
	private String pet_date;		// 반려동물이 된 날짜
	private String pet_birth;		// 반려동물 생일
	private String pet_color;		// 반려동물 색상
	private String pet_content;		// 반려동물 내용(비고)
	
}
