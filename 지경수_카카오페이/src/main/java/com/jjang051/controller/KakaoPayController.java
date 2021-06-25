package com.jjang051.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kakao/*")
public class KakaoPayController {

	private static final Logger logger = LoggerFactory.getLogger(KakaoPayController.class);
	
	@RequestMapping(value = "/kakaoPay.jsp", method = RequestMethod.GET)
	public String home() {

		return "/kakao/kakaoPay.jsp";
	}
}