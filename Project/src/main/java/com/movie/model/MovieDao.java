package com.movie.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MovieDao {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			String resource = "com/movie/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//전체 게시글
	public List<MovieBean> getAllMovie(int start, int end, String search, String word, String currYn) {
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("start"  , start);
		page.put("end"    , end);
		page.put("search" , search);
		page.put("word"   , word);	
		page.put("currYn"   , currYn);	
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList = sqlSession.selectList("getAllMovie", page);		
		
		sqlSession.close();
		
		return movieList;
	}
	
	// 삭제된 영화 리스트
	public List<MovieBean> getDeletedMovie(int start, int end, String search, String word, String currYn) {
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("start"  , start);
		page.put("end"    , end);
		page.put("search" , search);
		page.put("word"   , word);	
		page.put("currYn"   , currYn);	
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList = sqlSession.selectList("getDeletedMovie", page);		
		
		sqlSession.close();
		return movieList;
	}
	
	// 영화 등록
	public int insertMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMovie", movieBean);
		
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	// 영화 정보 가져오기
	public MovieBean getSelectOneMovie(int no) {
		MovieBean movieBean = new MovieBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		movieBean = sqlSession.selectOne("getSelectOneMovie", no);

		sqlSession.close();
		
		return movieBean;
	}
	
	// 영화 삭제하기
	public int deleteMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("deleteMovie", movieBean);
		
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	// 삭제된 영화 복원하기
	public int restoreMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("restoreMovie", movieBean);
		
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	// 영화 수정하기
	public int modifyMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("modifyMovie", movieBean);
		
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public int getTotalMovie() {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("getTotal");
		
		sqlSession.close();
		
		return total;
	}

	public List<MovieBean> showAllMovie(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList =sqlSession.selectList("showAllMovie");
		
		sqlSession.close();
		
		return movieList;
		
	}
	
}
