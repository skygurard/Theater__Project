package com.movie.model.member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReserveBean {
	
	
	String userId;
	String selectedTheater;
	String movieDate;
	String runningTime;
	String title;
	String age;
	String reserveSeat;
	
}
