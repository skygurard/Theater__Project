package com.movie.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.movie.model.MovieBean;
import com.movie.model.MovieDao;
import com.movie.model.admin.AdminBean;
import com.movie.model.admin.AdminDao;
import com.movie.model.member.MemberBean;
import com.movie.model.member.MemberDao;
import com.movie.model.member.ReserveBean;
import com.movie.model.member.ReserveDao;
import com.movie.utils.ScriptWriterUtil;

@Controller
public class ReserveController {
	
	@Autowired
	ReserveBean reserveBean;
	
	@Autowired
	ReserveDao reserveDao;
	@Autowired
	MovieBean movieBean;
	@Autowired
	AdminBean adminBean;
	@Autowired
	MemberBean memberBean;
	@Autowired
	MemberBean loggedMemberInfo;

	@Autowired
	MovieDao movieDao;
	@Autowired
	AdminDao adminDao;
	@Autowired
	MemberDao memberDao;
	
	
	
	
	@RequestMapping("/MemberReserve.do")
	public String insertMovie(ReserveBean reserveBean,
							  HttpServletRequest request,
							  HttpServletResponse response
							  ) throws IOException {
		String userId=request.getParameter("userId");
		String age= request.getParameter("age");
		String selectedTheater =request.getParameter("selectedTheater");
		String title=request.getParameter("title");
		String movieDate=request.getParameter("movieDate");
		String runningTime=request.getParameter("runningTime");
		String reserveSeat=request.getParameter("reserveSeat");
		reserveBean.setUserId(userId);
		reserveBean.setAge(age);
		reserveBean.setMovieDate(movieDate);
		reserveBean.setReserveSeat(reserveSeat);
		reserveBean.setRunningTime(runningTime);
		
		reserveBean.setSelectedTheater(selectedTheater);
		reserveBean.setTitle(title);
		
		int result = reserveDao.movieReserve(reserveBean);
		
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "영화가 예매되었습니다.", "Main.do");
			return null;
			
		}else {
			ScriptWriterUtil.alertAndNext(response, "영화가 예매되지 않았습니다.", "Main.do");
			return null;
		}
		
		
	}
	
	@RequestMapping("/MemberReserveList.do")
	public String memberInfo(Model model) {
		String userId = loggedMemberInfo.getId();
		reserveBean = reserveDao.getSelectOneReserve(userId);
		model.addAttribute("reserveBean", reserveBean);
		return "movie/member/member_reserve";
	}
	

}
