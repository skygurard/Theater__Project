package com.movie.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class movieReserveDao {
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
	
	public List<movieReserveBean> showAllReserveMovie() {
		//ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		//connection pool을 하나 땡겨 쓰겠다
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<movieReserveBean> movieReserveList = sqlSession.selectList("showAllReserveMovie");
		sqlSession.close();
		return movieReserveList;
	}
	
	public List<MovieBean> showAllMovie(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList =sqlSession.selectList("showAllMovie");
		sqlSession.close();
		return movieList;
		
	}
	
}

















