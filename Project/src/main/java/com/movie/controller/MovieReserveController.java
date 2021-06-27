package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.model.movieReserveBean;
import com.movie.model.movieReserveDao;
import com.movie.utils.ScriptWriterUtil;

@Controller
public class MovieReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieReserveController.class);
	//이걸 외부에서 주입받아서 쓰고 싶다.  Spring Container에 등록 해놓고 여기서 땡겨 쓰고 싶다.
	@Autowired
	movieReserveDao movieReserveDao;
	
	@Autowired
	movieReserveBean movieReserveBean;
	//	@GetMapping("/MovieReserveList.do")
//	public String movieReserveList(Model model) {
//		//MemberDao memberDao = new MemberDao();
//		List<movieReserveBean> movieReserveList = movieReserveDao.showAllReserveMovie();
//		model.addAttribute("movieReserveList", movieReserveList);
//		logger.info("movieReserveList{}",movieReserveList);
//		return "movie/movieReserveList";
//	}
	
}



















