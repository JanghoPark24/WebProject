package thelecture.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.BoardBean;

@Repository
public class LectureDaoImpl {
	//lecturedao xml파일과 연결
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public List<BoardBean> getlectureList() throws Exception {
		
		return sqlSession.selectList("lectureMap.getLectures");
		
	}
	
	
}
