package com.jjang051.controller;

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

import com.jjang051.model.MemberBean;
import com.jjang051.model.MemberDao;
import com.jjang051.utils.ScriptWriterUtil;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//이걸 외부에서 주입받아서 쓰고 싶다.  Spring Container에 등록 해놓고 여기서 땡겨 쓰고 싶다.
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberBean memberBean;
	
	@GetMapping("/MemberList.do")
	public String memberList(Model model) {
		//MemberDao memberDao = new MemberDao();
		List<MemberBean> memberList = memberDao.showAllMember();
		model.addAttribute("memberList", memberList);
		logger.info("memberList{}",memberList);
		return "member/member_list";
	}
	
	
}



















