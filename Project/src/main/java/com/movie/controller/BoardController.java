package com.movie.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.movie.model.board.ReplyBoardBean;
import com.movie.model.board.ReplyBoardDao;
import com.movie.utils.ScriptWriterUtil;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	ReplyBoardDao replyBoardDao;
	
	@Autowired
	ReplyBoardBean replyBoardBean;
	
	
	@GetMapping("/BoardList.do")
	public String boardList(HttpServletRequest request,Model model) {
		
		/// pagination
		String clickedPage = request.getParameter("clickedPage");
		if (clickedPage == null) {
			clickedPage = "1";
		}
		int pagePerCount = 5;
		int total = 0;
		int numbering = 0;
		int currentPage = Integer.parseInt(clickedPage);
		int start = (currentPage - 1) * pagePerCount + 1;
		int end = currentPage * pagePerCount;
		total = replyBoardDao.getTotal();

		int paginationTotal = (int) Math.floor(total / pagePerCount) + 1;
		int pageGroup = 3;
		int startPage = 1;
		numbering = total - (currentPage - 1) * pagePerCount;

		if (currentPage % pageGroup != 0) {
			startPage = (int) (currentPage / pageGroup) * pageGroup + 1;
		} else {
			startPage = ((int) (currentPage / pageGroup) - 1) * pageGroup + 1;
		}
		int endPage = startPage + pageGroup - 1;
		if (endPage > paginationTotal) {
			endPage = paginationTotal;
		}

		List<ReplyBoardBean> replyBoardList = replyBoardDao.getAllBoard(start, end);
		
		model.addAttribute("replyBoardList", replyBoardList);
		model.addAttribute("numbering", numbering);
		model.addAttribute("paginationTotal", paginationTotal);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pagePerCount", pagePerCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("clickedPage", clickedPage);
		model.addAttribute("currentPage", currentPage);

		return "movie/reply_board/board_list";
	}
	
	@GetMapping("/BoardView.do")
	public String boardView(Model model,int no) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);
		model.addAttribute("replyBoardBean", replyBoardBean);
		return "movie/reply_board/board_view";
	}
	
	@GetMapping("/BoardDeleteForm.do")
	public String boardDeleteForm(int no,Model model) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);
		model.addAttribute("replyBoardBean", replyBoardBean);
		model.addAttribute("no", no);
		return "movie/reply_board/board_delete";
	}
	
	@PostMapping("/BoardDelete.do")
	public String boardDelete(int no, String password,HttpServletResponse response) throws IOException {

		replyBoardBean.setNo(no);
		replyBoardBean.setPassword(password);
		
		String dbPassword = replyBoardDao.getPasswordBoard(no);
		
		if(dbPassword.equals(replyBoardBean.getPassword())) {
			int result = replyBoardDao.deleteBoard(no);
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "?????? ?????????????????????.", "BoardList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "?????? ???????????? ???????????????.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "??????????????? ????????? ?????????.");
			return null;
		}
	}

	@GetMapping("/BoardModifyForm.do")
	public String boardModifyForm(int no,Model model) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);
		model.addAttribute("replyBoardBean", replyBoardBean);
		model.addAttribute("no", no);
		return "movie/reply_board/board_modify";
	}
	
	@PostMapping("/BoardModify.do")
	public String boardModify(int no,ReplyBoardBean replyBoardBean,HttpServletResponse response) throws IOException {
		String dbPassword = replyBoardDao.getPasswordBoard(no);
		if(dbPassword.equals(replyBoardBean.getPassword())) {
			int result = replyBoardDao.updateBoard(replyBoardBean); 
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "?????? ?????????????????????.", "BoardList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "?????? ???????????? ???????????????.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "??????????????? ????????? ?????????.");
			return null;
		}
	}

	@GetMapping("/BoardWriteForm.do")
	public String boardWriteForm() {
		return "movie/reply_board/board_write";
	}
	
	@PostMapping("/BoardWrite.do")
	public String boardWrite(ReplyBoardBean replyBoardBean,HttpServletResponse response) throws IOException {
		int result = replyBoardDao.insertBoard(replyBoardBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "?????? ?????????????????????.", "BoardList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "?????? ???????????? ???????????????.");
			return null;
		}
	}
	
	
	@GetMapping("/BoardRewriteForm.do")
	public String boardRewriteForm(HttpServletRequest request,Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int reStep = Integer.parseInt(request.getParameter("reStep"));
		int reLevel = Integer.parseInt(request.getParameter("reLevel"));
		
		model.addAttribute("no", no);
		model.addAttribute("ref", ref);
		model.addAttribute("reStep", reStep);
		model.addAttribute("reLevel", reLevel);
		return "movie/reply_board/board_rewrite";
	}
	
	@PostMapping("/BoardRewrite.do")
	public String boardRewrite(HttpServletRequest request,HttpServletResponse response,ReplyBoardBean replyBoardBean) throws IOException {
		int result = replyBoardDao.rewriteBoard(replyBoardBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "????????? ?????????????????????.", "BoardList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "????????? ???????????? ???????????????.");
			return null;
		}
	}
	
	//@ResponseBody??? ?????? jsp??? ???????????? ?????? ?????? ??????????????? ????????????. ?????? json????????? ???????????? ?????? ??????.
	@RequestMapping(value="/SummerNoteImageUpload.do", produces="application/json;charset=UTF-8")
	@ResponseBody  // json ????????? ?????????.  ?????? ?????? ????????? jsp??? ????????????.
	public String sendImgFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request ) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		String fileRoot = "C:\\summernote\\";  //????????? ????????? ????????? ???????????? ?????? ??????
		String originaleFileName = multipartFile.getOriginalFilename();
		String extension = originaleFileName.substring(originaleFileName.lastIndexOf("."));
		String savedFileName = UUID.randomUUID()+extension;
		File targetFile = new File(fileRoot+savedFileName);
		String context = request.getContextPath(); //?????? contextRoot?????? ????????? ???????????? ??????
		//HashMap??? ???????????? ??????  JSON {"key":"value","key":"value","key":"value"}
		
		logger.info("context==={}",context);
		logger.info("originaleFileName==={}",originaleFileName);
		logger.info("savedFileName==={}",savedFileName);
		logger.info("targetFile==={}",targetFile);
		HashMap<String,String> hashMap = new HashMap<String,String>();
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //?????? ??????....
			hashMap.put("url",context + "/summernoteImage/" + savedFileName);
			hashMap.put("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);//io?????? ????????? ?????? ??????
			hashMap.put("responseCode", "error");
			e.printStackTrace();
		}
		String jsonData = objectMapper.writeValueAsString(hashMap);
		logger.info("jsonData==={}",jsonData);
		return jsonData;
	}
}










































