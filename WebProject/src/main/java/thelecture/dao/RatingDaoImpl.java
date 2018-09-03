package thelecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.Lecture_ratingBean;
import thelecture.model.QuestionBean;

@Repository
public class RatingDaoImpl {
	@Autowired
	private SqlSession sqlSession;

	public List<Lecture_ratingBean> getRBList(int lecture_id)  {
		List<Lecture_ratingBean> result = sqlSession.selectList("getLRBList", lecture_id);
		return result;
	}
	
	public List<QuestionBean> getQBList(int lecture_id)  {
//		List<QuestionBean> result = sqlSession.selectList("getQBList", lecture_id);
		List<QuestionBean> result = sqlSession.selectList("getQBList_t", lecture_id);
		return result;
	}

}
