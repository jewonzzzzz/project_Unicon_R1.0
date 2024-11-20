package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdptCounselVO {
	private int counsel_id;
	private Timestamp counsel_subdate;
	private String counsel_status;
	
}
