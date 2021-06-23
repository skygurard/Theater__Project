package com.movie.model.board;

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
public class ReplyBoardDao {
	//커넥션 pool 튜브
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
	public List<ReplyBoardBean> getAllBoard(int start, int end) {
		Map<String,Integer> page = new HashMap<String,Integer>();
		page.put("start", start);
		page.put("end", end);
		//넘어오는 매개변수는 2개, sqlSession.selectList("getAllBoard", page); 넘길 수 있는 있는 건 id를 제외한 하나
		//그래서 하나의 변수에 여러개를 담을 수 있는 HashMap을 이용해서 여러개의 데이터를 담고 이를 넘긴 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ReplyBoardBean> replyBoardList = sqlSession.selectList("getAllBoard", page);
		sqlSession.close();
		return replyBoardList;
	}
	
	
	//최대값 구하기
	public int getMaxRef() {
		int max = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		max = sqlSession.selectOne("getMaxRef");
		sqlSession.close();
		return max;
	}
	
	
	//새글쓰기
	public int insertBoard(ReplyBoardBean replyBoardBean) {
		int result = 0;

		int ref = 0;
		int reStep = 1;
		int reLevel = 1;
		ref = getMaxRef() + 1;
		
		replyBoardBean.setRef(ref);
		replyBoardBean.setReStep(reStep);
		replyBoardBean.setReLevel(reLevel);
		replyBoardBean.setReadCount(0);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertBoard",replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
			
		return result;
	}
	
	//readCount증가
	public int updateReadCount(int no) {
		int readCount = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		readCount = sqlSession.update("updateReadCount",no);
		sqlSession.commit();
		sqlSession.close();
		return readCount;
	}
	
	
	//글읽기
	public ReplyBoardBean getSelectOneBoard(int no) {
		ReplyBoardBean replyBoardBean = new ReplyBoardBean();
		updateReadCount(no);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		replyBoardBean = sqlSession.selectOne("getSelectOneBoard", no);

		sqlSession.close();
		return replyBoardBean;
	}
	
	//글 삭제0
	public int deleteBoard(int no) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteBoard",no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//글 수정
	public int updateBoard(ReplyBoardBean replyBoardBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateBoard", replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int updateRefAndLevel(ReplyBoardBean replyBoardBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateRefAndLevel",replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//답글쓰기
	public int rewriteBoard(ReplyBoardBean replyBoardBean) {
		int result = 0;
		int ref = replyBoardBean.getRef();
		int reStep = replyBoardBean.getReStep();
		int reLevel = replyBoardBean.getReLevel();

		updateRefAndLevel(replyBoardBean);
		reStep += 1;
		reLevel+=1;
		replyBoardBean.setRef(ref);
		replyBoardBean.setReStep(reStep);
		replyBoardBean.setReLevel(reLevel);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("rewriteBoard", replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//비밀번호 뽑아오기
	public String getPasswordBoard(int no) {
		String password = "";
		SqlSession sqlSession = sqlSessionFactory.openSession();
		password = sqlSession.selectOne("getPasswordBoard",no);
		sqlSession.close();
		return password;
	}
	
	
	//전체 게시글 수
	public int getTotal() {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("getTotal");
		sqlSession.close();
		return total;
	}
}











