package com.movie.model;

import org.springframework.stereotype.Component;


import lombok.Data;



@Component
@Data
public class MovieBean {

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
}
