package thelecture.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.dao.LectureDaoImpl;
import thelecture.dao.RatingDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.PageBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;
import thelecture.model.UnivBean;

@Service
@Transactional
public class BoardService {

	@Autowired
	LectureDaoImpl lecturedao;
	
	@Autowired
	RatingDaoImpl ratingdao;
	/**
	 * service 하는 일 1. 현재 페이지에 따라 리스트 불러옴 2. 검색어, 키워드에 따라 바뀜
	 * 
	 * @param 설명:페이지,
	 *            검색어 찾기
	 * @return 페이지정보, 검색한 값, 알맞은 리스트를 hashmap에 담아서 return
	 */
	public HashMap<String, Object> getLectureBoard(int currentPage, PageBean pagebean) {

		HashMap<String, Object> boardInfo = new HashMap<>();

		// 현재 총 행
		int countOfRow = lecturedao.getRowCount(pagebean);

		System.out.println("countOfRow:" + countOfRow);
		
		// 행이 0이 아니면 list를 찾음 .
		if (countOfRow != 0) {
			// 페이지 정보 정하기
			pagebean.setPage_andRow(currentPage, countOfRow);

			// list구하기
			List<LectureBean> lectureList = lecturedao.getLectureList(pagebean);
			
			// 평균 구하기
			lecturedao.getAvgScoreByList(lectureList);
			//user
			lecturedao.getRatedUsersByList(lectureList);
			
			
			// 찾은 lectureList 추가
			boardInfo.put("lectureList", lectureList);
			boardInfo.put("page_index", pagebean);
		}

		return boardInfo;

	}

	public List<String> getQuestionVersions() {

		return lecturedao.getQuestionVersions();
	}

	public List<QuestionBean> getQuestionnaire(String questionVersion) {

		return lecturedao.getQuestionnaire(questionVersion);
	}

	public int insertQuestion(String question_version, String[] question_contents) {

		// question Version 입력
		int result = lecturedao.insertQuestionVersion(question_version);

		// questionContent 입력
		int result2 = lecturedao.insertQuestion(question_version, question_contents);

		// 둘 모두가 성공 --> 성공 , 둘 중 하나가 실패 --> 실패
		return result == 0 && result2 == 0 ? 0 : 1;
	}

	public int deleteQuestion(String question_version) {

		return lecturedao.deleteQuestion(question_version);

	}

	public int updateQuestion(String[] questionIDs, String[] questionContents) {

		return lecturedao.updateQuestion(questionIDs, questionContents);
	}

	public boolean insertLecture(LectureBean lecture) {
		// TODO Auto-generated method stub
		return lecturedao.insertLecture(lecture);
	}

	public boolean updateLecture(LectureBean lecture) {
		int updatedRow = lecturedao.updateLecture(lecture);
		return (updatedRow == 1) ? true : false;
	}

	public LectureBean getLectureById(int lecture_id) {

		return lecturedao.getLectureById(lecture_id);
	}

	public boolean deleteLecture(int lecture_id) {
		int deletedRow = lecturedao.deleteLecture(lecture_id);
		return (deletedRow == 1) ? true : false;
	}

	public boolean answerQuestion(int lecture_id, String question_version,
								String email, int[] question_id,
								int[] question_value) {
		boolean alreadyAnswered = ratingdao.checkIsAlreadyAnsweredByThisEmail(lecture_id,email, question_version); 
		boolean answerSucceed;
		//아직 이 이메일로 평가 x
		if(alreadyAnswered==false) {
			answerSucceed=ratingdao.insertAnswer(lecture_id, email, question_version, question_id, question_value);
		}else {
			answerSucceed=ratingdao.updateAnswer(lecture_id, email, question_version,question_id, question_value);
		}
		return answerSucceed;
	}

}
