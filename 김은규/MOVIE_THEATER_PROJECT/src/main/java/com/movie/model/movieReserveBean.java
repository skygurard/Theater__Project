package com.movie.model;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class movieReserveBean {
	
		private int no;
		private String theater_place;
		private String theater_location;
		private String movie_list_title;
		private String movie_list_age;
		private String movie_reserve_date;
		
		
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
