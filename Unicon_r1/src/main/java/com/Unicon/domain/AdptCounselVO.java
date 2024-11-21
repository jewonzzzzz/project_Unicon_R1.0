package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdptCounselVO {
	
	private String adpt_id;
	private int counsel_id;
	private Timestamp counsel_subdate;
	private Timestamp counsel_procdate;
	private String counsel_status;

}
