package com.jjang051.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjang051.model.admin.AdminBean;
import com.jjang051.model.admin.AdminDao;
import com.jjang051.utils.ScriptWriterUtil;


public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	AdminBean adminBean;
	
	@Autowired
	AdminBean loggedAdminInfo;
	
	@GetMapping("/AdminLoginForm.do")
	public String adminLoginForm() {
		return "admin/admin_login";
	}
	
	@PostMapping("/AdminLogin.do")
	public String adminLogin(String id, String password, HttpSession session, HttpServletResponse response) throws IOException {
		
		adminBean.setId(id);
		adminBean.setPassword(password);
		
		loggedAdminInfo = adminDao.getLoginAdmin(adminBean);
		
		if(loggedAdminInfo!=null) {
			session.setAttribute("loggedAdminInfo", loggedAdminInfo);
			ScriptWriterUtil.alertAndNext(response, "로그인 되었습니다.", "BoardList.do");
			
			//로그인이 되었당.
		} else {
			//로그인이 실패.
			ScriptWriterUtil.alertAndBack(response, "아이디 비밀번호 확인해 주세요.");
		}
		return null;
	}
	
	
	@GetMapping("/AdminLogOut.do")
	public String adminLogOut(HttpSession session, HttpServletResponse response) throws IOException {
		loggedAdminInfo = (AdminBean)session.getAttribute("loggedAdminInfo");
		if(loggedAdminInfo==null) {
			ScriptWriterUtil.alertAndNext(response, "로그인 해주세요", "AdminLogin.do");	
			return null;
		} else {
			ScriptWriterUtil.alertAndNext(response, "로그아웃 되었습니다.", "BoardList.do");
			session.invalidate();
			return null;
		}
	}
}
