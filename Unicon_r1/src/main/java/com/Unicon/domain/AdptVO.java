package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;


import lombok.Data;

@Data
public class AdptVO {
	private String adpt_id;
	private int pet_code;
	private String pet_etc_breed;
	private String adpt_name;
	private String adpt_color;
	private String adpt_gender;
	private String adpt_neuter;
	private String adpt_age;
	private String adpt_weight;
	private String adpt_image;
	private List<String> adpt_images;
	private Timestamp adpt_regdate;
	private Timestamp adpt_upddate;
	private String adpt_regnum;
	private int adpt_act;
	private int adpt_social;
	private String adpt_health;
	private List<String> adpt_healths;
	private String adpt_vaccin;
	private List<String> adpt_vaccins;
	private String adpt_intro;
	private String adpt_etc;
	private String adpt_status;
	private int adpt_interest_sum;
	
	private AdptInstVO adptInst;
	private AdptCounselVO adptCounsel;
	private AdptMemberVO adptMember;
	
	
}
