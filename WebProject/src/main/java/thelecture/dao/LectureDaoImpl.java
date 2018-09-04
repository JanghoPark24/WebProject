package thelecture.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.LectureBean;
import thelecture.model.PageBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;
import thelecture.model.UnivBean;

@Repository
public class LectureDaoImpl {
	// lecturedao xml파일과 연결
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public int getRowCount(PageBean pagebean) {
		try {
			// search, keyword 전달
			return sqlSession.selectOne("lectureMap.getRowCount", pagebean);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Transactional
	public List<LectureBean> getAllLectureList() {
		try {
			return sqlSession.selectList("lectureMap.getAllLectures");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Transactional
	// public List<LectureBean> getLectureList(HashMap<String, Integer> page_index)
	// {
	public List<LectureBean> getLectureList(PageBean page_index) {
		try {
			return sqlSession.selectList("lectureMap.getLectureList", page_index);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public LectureBean getLectureById(int lecture_id) {
		try {

			return sqlSession.selectOne("lectureMap.getLectureById", lecture_id);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<QuestionBean> getQuestionnaire(String questionVersion) {
		try {

			return sqlSession.selectList("lectureMap.getQuestionnaire", questionVersion);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<String> getQuestionVersions() {
		try {

			return sqlSession.selectList("lectureMap.getQuestionVersions");

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertQuestion_content(List<String> questionList) {

		try {

			sqlSession.insert("lectureMap.insertQuestions", questionList);

			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public int insertQuestionVersion(String question_version) {
		try {
			sqlSession.insert("lectureMap.insertLectureQuestionVersion", question_version);
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}

	}
	/*
	 * question 입력
	 * 
	 * 
	 */

	public int insertQuestion(String question_version, String[] question_contents) {
		try {
			int contents_size = question_contents.length;
			HashMap<String, String> questionMap = new HashMap<>();
			questionMap.put("question_version", question_version);
			for (int i = 0; i < contents_size; i++) {
				questionMap.put("question_content", question_contents[i]);
				sqlSession.insert("lectureMap.insertLectureQuestion", questionMap);
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}

	}

	public int deleteQuestion(String question_version) {
		try {
			sqlSession.update("lectureMap.deleteQuestion", question_version);
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public int updateQuestion(String[] questionIDs, String[] questionContents) {
		try {
			QuestionBean question = new QuestionBean();

			for (int i = 0; i < questionIDs.length; i++) {
				question.setQuestion_id(Integer.parseInt(questionIDs[i]));
				question.setQuestion_content(questionContents[i]);
				sqlSession.update("lectureMap.updateQuestion", question);
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public boolean insertLecture(LectureBean lecture) {

		int insertedRow = sqlSession.insert("lectureMap.insertLecture", lecture);

		return insertedRow == 1 ? true : false;
	}

	public List<String> getLec_list() {
		return sqlSession.selectList("getLec_list");
	}

	public int updateLecture(LectureBean lecture) {
		int result;
		try {
			result = sqlSession.update("lectureMap.updateLecture", lecture);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	public int deleteLecture(int lecture_id) {
		int result;
		try {
			result = sqlSession.update("lectureMap.deleteLecture", lecture_id);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	public String getQuestionVersionById(int lecture_id) {
		try {

			return sqlSession.selectOne("lectureMap.getQuestionVersionById", lecture_id);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void getAvgScoreByList(List<LectureBean> lectureList) {

		try {
			LectureBean lecture = null;
			for (int i = 0; i < lectureList.size(); i++) {
				lecture = lectureList.get(i);

				int lecture_id = lecture.getLecture_id();
				Double avg_score = sqlSession.selectOne("getAvgScoreById", lecture_id);
				lecture.setTotal_avg_score(avg_score);
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public void getRatedUsersByList(List<LectureBean> lectureList) {
		try {
			LectureBean lecture = null;
			for (int i = 0; i < lectureList.size(); i++) {
				lecture = lectureList.get(i);
				
				int rated_users = sqlSession.selectOne("getRatedUsersByLectureId", lecture.getLecture_id());
				lecture.setRating_count(rated_users);
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public Double getAvgScoreById(int lecture_id) {
		try {
			return sqlSession.selectOne("lectureRatings.getAvgScoreById", lecture_id);

		} catch (Exception e) {
			e.printStackTrace();
			return -1.0;
		}
	}

	public int getRatedUsersById(int lecture_id) {
		try {

			return sqlSession.selectOne("lectureRatings.getRatedUsersByLectureId", lecture_id);

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public boolean insertAvgScoreToLectureByLectureId(Double avg_score, int lecture_id) {
		int insertedRow;
		HashMap <String, Object>score_map = new HashMap<>();
		score_map.put("avg_score", avg_score);
		score_map.put("lecture_id", lecture_id);
		
		try {
			
			insertedRow =sqlSession.insert("lectureMap.insertAvgScoreById",score_map);
		}catch(Exception e) {
			insertedRow=0;
			e.printStackTrace();
		}
		return (insertedRow==0)? false:true;
	}

	public boolean insertRatingCountToLectureByLectureId(int ratedUsers, int lecture_id) {
		int insertedRow;
		HashMap <String, Object>score_map = new HashMap<>();
		score_map.put("rating_count", ratedUsers);
		score_map.put("lecture_id", lecture_id);
		
		try {
			
			insertedRow =sqlSession.insert("lectureMap.insertRatingCountById",score_map);
		}catch(Exception e) {
			insertedRow=0;
			e.printStackTrace();
		}
		return (insertedRow==0)? false:true;
	}

}
