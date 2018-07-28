package thelecture.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.BoardBean;

@Repository
public class LectureDaoImpl {
	//lecturedao xml파일과 연결
	@Autowired
	private SqlSession sqlSession;
	
	public BoardBean getlectureList() throws Exception {
		
			return (BoardBean) sqlSession.selectList("lectureMap.getLectures");
		
	}
	
	
}
