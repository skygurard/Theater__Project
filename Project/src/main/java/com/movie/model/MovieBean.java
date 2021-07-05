package com.movie.model;

import org.springframework.stereotype.Component;


import lombok.Data;



@Component
@Data
public class MovieBean {

	// Ctrl + Shift + x 대문자
	// Ctrl + Shift + y 소문자
	// jsp name = get,set name = db 컬럼이름
	private int    no;
	private String title;
	private String info;
	private String director;
	private String actor;
	private String runningTime;
	private String releaseDate;
	private String endDate;
	private String country;
	private String posterImg;
	private String genre;
	private String age;
	private String DB_STATUS;
	
}
