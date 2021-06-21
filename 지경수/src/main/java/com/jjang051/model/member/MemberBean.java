package com.jjang051.model.member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberBean {
	private int no;
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String interest;
	private String age;
	private String profileImg;
	private int grade;
	private String create_at; 
}
