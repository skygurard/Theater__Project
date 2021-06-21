package com.jjang051.model.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


@Component
public class AdminDao {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			String resource = "com/jjang051/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<AdminBean> showAllAdmin() {
		//ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		//connection pool을 하나 땡겨 쓰겠다
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<AdminBean> adminList = sqlSession.selectList("showAllAdmin");
		sqlSession.close();
		return adminList;
	}
	
	public AdminBean getSelectOneAdmin(int no) {
		AdminBean adminBean = new AdminBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		adminBean = sqlSession.selectOne("getSelectOneAdmin",no);
		sqlSession.close();
		return adminBean;
	}
	
	public int insertAdmin(AdminBean adminBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertAdmin", adminBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int updateAdmin(AdminBean adminBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateAdmin", adminBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteAdmin(int no) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteAdmin", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public String getPasswordAdmin(int no) {
		String password = "";
		SqlSession sqlSession = sqlSessionFactory.openSession();
		password = sqlSession.selectOne("getPasswordAdmin", no);
		sqlSession.close();
		return password;
	}
	
	public int idCheck(String id) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("idCheck",id);
		sqlSession.close();
		return  result;
	}
	
	public AdminBean getLoginAdmin(AdminBean adminBean) {
		AdminBean loggedAdminInfo = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		loggedAdminInfo = sqlSession.selectOne("getLoginAdmin",adminBean);
		sqlSession.close();
		return loggedAdminInfo;
	}
}


























