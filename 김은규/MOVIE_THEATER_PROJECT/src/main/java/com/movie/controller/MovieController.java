package com.movie.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.movie.model.MovieBean;
import com.movie.model.MovieDao;
import com.movie.utils.PagingUtil;
import com.movie.utils.ScriptWriterUtil;

@Controller
public class MovieController {

	@Autowired
	MovieBean movieBean;
	
	@Autowired
	MovieDao movieDao;

	// 관리자 페이지 매핑 
	@GetMapping("/InsertMovieForm.do")
	public String insertMovieForm() {
		return "movie/admin/insert_movie";
	}
	
	@RequestMapping("/InsertMovie.do")
	public String insertMovie(MovieBean movieBean,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  MultipartFile multipartPosterImg) throws IOException {
		
		Date nowdate 			    = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String dbDate 				= dateFormat.format(nowdate);
		String[] genreList = request.getParameterValues("genre");
		String genreText   ="";
		
		if(genreList != null) {
			for(int i=0; i<genreList.length;i++) {
				if(genreText.equals("")) {
					genreText = genreList[i];
				}else {
					genreText += "/"+ genreList[i];
				}
			}
			movieBean.setGenre(genreText); //  genreText = 공포/스릴러/범죄
		} else {
			movieBean.setGenre("");
		};
		
		String context 			= request.getContextPath();
		String fileRoot 		= "C:\\movieproject_image\\";
		String originalFileName = multipartPosterImg.getOriginalFilename();
		String extension 		= FilenameUtils.getExtension(originalFileName);
		String savedFileName 	= dbDate+"."+extension;
		File targetFile 		= new File(fileRoot + savedFileName);
		String dbSavedFile 		= context + "/movieProject/" + savedFileName;

		movieBean.setPosterImg(dbSavedFile);
		
		try {
			InputStream fileStream = multipartPosterImg.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		
		int result = movieDao.insertMovie(movieBean);
		
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "영화등록이 완료되었습니다.","ListMovie.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "등록에 실패하였습니다.");
			return null;
		}
	}
	
	@GetMapping("/ListMovieAdmin.do")
	public String listMovieAdmin(HttpServletRequest request, Model model) {
		
		String clickedPage = request.getParameter("clickedPage");
		int total 		   = 0;
		total 			   = movieDao.getTotalMovie();
		
		HashMap<String, Integer> dataMap = PagingUtil.setPaging(clickedPage, total);

		List<MovieBean> movieList = movieDao.getAllMovie(dataMap.get("start"), dataMap.get("end"));
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("numbering", dataMap.get("numbering"));
		model.addAttribute("pageGroup", dataMap.get("pageGroup"));
		model.addAttribute("startPage", dataMap.get("startPage"));
		model.addAttribute("endPage", dataMap.get("endPage"));
		model.addAttribute("total", total);
		model.addAttribute("clickedPage", clickedPage);
		model.addAttribute("currentPage", dataMap.get("currentPage"));
		
		return "movie/admin/list_movie_admin";
	}
	
	@GetMapping("/ViewMovieAdmin.do")
	public String viewMovie(Model model, int no) {
		
		movieBean = movieDao.getSelectOneMovie(no);
		model.addAttribute("movieBean", movieBean);
		
		return "movie/admin/view_movie_admin";
	}
	
	@GetMapping("/ModifyMovieForm.do")
	public String modifyMovieForm(int no, Model model) {
		movieBean = movieDao.getSelectOneMovie(no);
		model.addAttribute("movieBean", movieBean);
		model.addAttribute("no", no);
		
		return "movie/admin/modify_movie_form_admin";
	}
	
//	@PostMapping("/ModifyMovie.do")
//	public String boardModify(int no,MovieBean movieBean,HttpServletResponse response) throws IOException {
//		String dbPassword = adminDao.getPasswordAdmin(no);
//		if(dbPassword.equals(adminBean.getPassword())) {
//			int result = movieDao.modifyMovie(movieBean); 
//			if(result > 0) {
//				ScriptWriterUtil.alertAndNext(response, "글이 수정되었습니다.", "MovieListAdmin.do");
//				return null;
//			} else {
//				ScriptWriterUtil.alertAndBack(response, "글이 수정되지 않았습니다.");
//				return null;
//			}
//		} else {
//			ScriptWriterUtil.alertAndBack(response, "비민번호를 확인해 주세요.");
//			return null;
//		}
//	}
	
//	@GetMapping("/DeleteMovie.do")
//	public String deleteMovie(int no, Model model, String password, HttpServletResponse response) throws IOException {
//		//String dbPassword = AdminDao.getPasswordAdmin(no); Admin테이블에서 pw가져오기
//		if(dbPassword.equals(password)){
//			int result = movieDao.deleteMovie(no);
//			if(result>0) {
//				ScriptWriterUtil.alertAndNext(response,"영화가 삭제되었습니다.","MovieListAdmin.do");
//				return null;
//			} else {
//				ScriptWriterUtil.alertAndBack(response,"영화 삭제에 실패했습니다.");
//				return null;
//			}
//		} else {
//			ScriptWriterUtil.alertAndBack(response," 비밀번호를 확인해주세요.");
//			return null;
//		}
//	}
	
	
///////////////////////////////////////////////////////////////////////
	// user페이지 매핑
	
	@GetMapping("/ListMovie.do")
	public String listMovie(MovieBean movieBean, HttpServletRequest request, Model model) {
	//list?f=title&q=a
	
		
		
	String clickedPage = request.getParameter("clickedPage");
	int total 		   = 0;
	total 			   = movieDao.getTotalMovie();
	
	HashMap<String, Integer> dataMap = PagingUtil.setPaging(clickedPage, total);
	
	List<MovieBean> movieList = movieDao.getAllMovie(dataMap.get("start"), dataMap.get("end"));
	
	model.addAttribute("movieList", movieList);
	model.addAttribute("numbering", dataMap.get("numbering"));
	model.addAttribute("pageGroup", dataMap.get("pageGroup"));
	model.addAttribute("startPage", dataMap.get("startPage"));
	model.addAttribute("endPage", dataMap.get("endPage"));
	model.addAttribute("total", total);
	model.addAttribute("clickedPage", clickedPage);
	model.addAttribute("currentPage", dataMap.get("currentPage"));
	model.addAttribute("paginationTotal", dataMap.get("paginationTotal"));
	model.addAttribute("pagePerCount", dataMap.get("pagePerCount"));
	
	return "movie/user/list_movie";
	
	}
	
	@GetMapping("/ViewMovie.do")
	public String viewMovie(int no, Model model) {
		
		movieBean = movieDao.getSelectOneMovie(no);
		model.addAttribute("movieBean", movieBean);
		
		return "movie/user/view_movie";
	}
	
//	@RequestMapping(value = "/MovieListJson.do", produces ="application/json;charset=UTF-8")
//	@ResponseBody
//	public String movieListJson(Model model) throws JsonProcessingException {
//		ObjectMapper objectMapper = new ObjectMapper();
//		HashMap<String, List<MovieBean>> hashMap = new HashMap<String, List<MovieBean>>();
//		List<MovieBean> movieList = movieDao.getAllMovie();
//		hashMap.put("movieList", movieList);
//		
//		String jsonData = objectMapper.writeValueAsString(hashMap);
//		
//		return jsonData;
//	}
	
}
