package com.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class KakaoPayController {

	@RequestMapping(value="/kakaoPay.do",method = RequestMethod.GET)
	public String movieSeatBooking() {
		return "movie/kakaoPay";
	}
}
