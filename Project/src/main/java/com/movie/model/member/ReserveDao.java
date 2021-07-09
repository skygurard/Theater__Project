package com.movie.model.member;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


@Component
public class ReserveDao {
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
	public int movieReserve(ReserveBean reserveBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("movieReserve", reserveBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public ReserveBean getSelectOneReserve(String userId) {
		ReserveBean reserveBean = new ReserveBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		reserveBean = sqlSession.selectOne("getSelectOneReserve",userId);
		sqlSession.close();
		return reserveBean;
	}
	

}
