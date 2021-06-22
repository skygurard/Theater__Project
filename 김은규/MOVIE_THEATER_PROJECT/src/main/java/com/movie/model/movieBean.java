package com.movie.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class movieBean {
	private int    no;
	private String title;
	private String info;
	private String director;
	private String actor;
	private String runningTime;
	private String age;
	private String releaseDate;
	private String endDate;
	private String country;
	private String genre;
	private String profileImg;
		
}
