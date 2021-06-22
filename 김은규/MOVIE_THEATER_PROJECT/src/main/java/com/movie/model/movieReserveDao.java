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
	
	public List<movieReserveBean> showAllMember() {
		//ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		//connection pool을 하나 땡겨 쓰겠다
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<movieReserveBean> memberList = sqlSession.selectList("showAllMember");
		sqlSession.close();
		return memberList;
	}
	
	
}

















