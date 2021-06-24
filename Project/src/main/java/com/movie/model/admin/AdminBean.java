package com.movie.model.admin;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AdminBean {
	private int no;
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String interest;
	private String age;
	private String profileImg;
}
