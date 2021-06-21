package com.jjang051.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberBean {
	
		private int no;
		private String theater_place;
		private String theater_location;
		private String movie_list_title;
		private String movie_list_age;
		private String movie_reserve_date;
}
