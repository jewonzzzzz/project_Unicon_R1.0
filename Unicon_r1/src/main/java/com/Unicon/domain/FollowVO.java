package com.Unicon.domain;

import lombok.Data;

@Data
public class FollowVO {
	
	private String from_member_id;		//유저 아이디
	private String to_member_id;		//팔로우 아이디
	
}
