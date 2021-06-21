package com.jjang051.model.board;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyBoardBean {
	private int no;
	private String name;
	private String email;
	private String subject;
	private String password;
	private Date regDate;  // 날짜
	private int ref;         // 원글의 레퍼런스
	private int reStep;      // 원글에 달리는 답글의 깊이....
	private int reLevel;     // 답글들을 순서대로 정렬하기 위한 숫자
	private int readCount;   // 조회수
	private String contents;
	
}
