package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdptInterestVO {
	
	private String adpt_id;
	private String member_id;
	private Timestamp interest_regdate;
	
} 

