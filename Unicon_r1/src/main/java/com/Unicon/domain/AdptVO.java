package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class AdptVO {
	
	private String adpt_id;
	private int pet_code;
	private String adpt_name;
	private String adpt_color;
	private String adpt_gender;
	private String adpt_neuter;
	private String adpt_age;
	private String adpt_weight;
	private String member_id;
	private String pet_etc_breed;
	private Timestamp adpt_regdate;
	private Timestamp adpt_upddate;
	private String adpt_regnum;
	private int adpt_act;
	private int adpt_social;
	private List<ImageVO> adpt_images;
	private List<AdptHealthVO> adpt_healths;
	private List<AdptVaccineVO> adpt_vaccines;
	private String adpt_intro;
	private String adpt_etc;
	private String adpt_status;
	
	private AdptCounselVO adptCounsel;
	private AdptMemberVO adptMember;
	private AdptInterestVO adptInterest;
	
} 