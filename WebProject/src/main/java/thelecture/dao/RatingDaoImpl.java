package thelecture.dao;

import java.util.HashMap;
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

/*	public List<Lecture_ratingBean> getRBList(int lecture_id)  {
		
		List<Lecture_ratingBean> result = sqlSession.selectList("getLRBList", lecture_id);
		return result;
	}
*/	public List<Lecture_ratingBean> getRBList(int lecture_id, String question_version)  {
		HashMap< String, Object> lecture_info = new HashMap<>();
		lecture_info.put("lecture_id",lecture_id);
		lecture_info.put("question_version",question_version);
		List<Lecture_ratingBean> result = sqlSession.selectList("getLRBList", lecture_info);
		return result;
	}
	
	public List<QuestionBean> getQuestionsByVersion(String question_version)  {
//		List<QuestionBean> result = sqlSession.selectList("getQBList", lecture_id);
		List<QuestionBean> result = sqlSession.selectList("getQBList_t", question_version);
		return result;
	}
	

	public boolean checkIsAlreadyAnsweredByThisEmail(int lecture_id, String email,String question_version) {
		HashMap <String, Object> answerInfo = new HashMap<>();
		int affectedRows;
		try {
			answerInfo.put("lecture_id", lecture_id);
			answerInfo.put("email", email);
			answerInfo.put("question_version", question_version);
			affectedRows = sqlSession.selectOne("lectureRatings.checkIsAlreadyAnsweredByThisEmail",answerInfo);
		}catch(Exception e){
			e.printStackTrace();
			affectedRows=0;
		}
		return affectedRows==0? false:true;
	}

	public boolean insertAnswer(int lecture_id, String email,String question_version, int[] question_id, int[] question_value) {
		QuestionBean answerInfo = new QuestionBean();
		int affectedRows=0;
		try {
			int qlength = question_id.length;
			
			//lecture id, email, question version 설정
			answerInfo.setLecture_id(lecture_id);
			answerInfo.setEmail(email);
			answerInfo.setQuestion_version(question_version);
			
			for(int i =0; i< qlength ;i++) {
				
				answerInfo.setQuestion_id(question_id[i]);
				answerInfo.setQuestion_value(question_value[i]);
				
				affectedRows += sqlSession.insert("lectureRatings.insertAnswers",answerInfo);
			}
		}catch(Exception e){
			e.printStackTrace();
			affectedRows=0;
		}
		
		return (affectedRows==0)?false:true;
		
	}


	public boolean updateAnswer(int lecture_id, String email, String question_version, int[] question_id,int[] question_value) {
		QuestionBean answerInfo = new QuestionBean();
		int affectedRows=0;
		try {
			int qlength = question_id.length;
			
			//lecture id, email, question version 설정
			answerInfo.setLecture_id(lecture_id);
			answerInfo.setEmail(email);
			answerInfo.setQuestion_version(question_version);
			
			for(int i =0; i< qlength ;i++) {
				answerInfo.setQuestion_id(question_id[i]);
				answerInfo.setQuestion_value(question_value[i]);
				affectedRows += sqlSession.insert("lectureRatings.updateAnswers",answerInfo);
			}
		}catch(Exception e){
			e.printStackTrace();
			affectedRows=0;
		}
		
		return (affectedRows==0)?false:true;
	}
	
	public int getRatedUsers(int lecture_id, String question_version) {
		HashMap< String, Object> lectureInfo = new HashMap<>();
		int usersCount;
		try {
			//lecture id, email, question version 설정
			lectureInfo.put("lecture_id", lecture_id);
			lectureInfo.put("question_version", question_version);
			
			usersCount=sqlSession.selectOne("lectureRatings.getRatedUsersPerLecture_byQuestionVersion",lectureInfo);
			
		}catch(Exception e){
			e.printStackTrace();
			usersCount=0;
		}
		return usersCount;
	}
	

}
