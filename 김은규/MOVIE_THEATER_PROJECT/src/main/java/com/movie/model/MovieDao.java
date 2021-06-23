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
	public List<MovieBean> getAllMovie(int start, int end) {
		Map<String,Integer> page = new HashMap<String,Integer>();
		page.put("start", start);
		page.put("end", end);
		//넘어오는 매개변수는 2개, sqlSession.selectList("getAllMovie", page); 넘길 수 있는 있는 건 id를 제외한 하나
		//그래서 하나의 변수에 여러개를 담을 수 있는 HashMap을 이용해서 여러개의 데이터를 담고 이를 넘긴 
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
	

	
	public int getTotal() {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("getTotal");
		sqlSession.close();
		return total;
	}
	
	
//	public List<MovieBean> showAllMovie() {
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		List<MovieBean> movieList = sqlSession.selectList("showAllMovie");
//		sqlSession.close();
//		
//		return movieList;
//	}
	
	
	
	
	
	
}
