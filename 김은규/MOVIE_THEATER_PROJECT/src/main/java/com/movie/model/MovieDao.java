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
	
	public List<MovieBean> getAllMovie(int start, int end) {
		Map<String,Integer> page = new HashMap<String,Integer>();
		page.put("start", start);
		page.put("end", end);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList = sqlSession.selectList("getAllMovie", page);
		sqlSession.close();
		return movieList;
	}
	
	public int insertMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMovie", movieBean);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	public MovieBean getSelectOneMovie(int no) {
		MovieBean movieBean = new MovieBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		movieBean = sqlSession.selectOne("getSelectOneMovie", no);
		sqlSession.close();
		return movieBean;
	}
	
	public int deleteMovie(int no) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteMovie",no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
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
}
