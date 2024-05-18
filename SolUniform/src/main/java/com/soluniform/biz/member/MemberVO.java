package com.soluniform.biz.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String pwd;
	private String member_name;
	private String birthday;
	private String gender;
	private String email;
	private String tel;
	private String address1;
	private String address2;
	private Timestamp reg_date;
}
