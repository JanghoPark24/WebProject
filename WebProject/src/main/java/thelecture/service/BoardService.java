package thelecture.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.LectureDaoImpl;

import thelecture.model.LectureBean;
import thelecture.model.PageBean;
import thelecture.model.ReplyBean;

@Service
public class BoardService {
	
	@Autowired
	LectureDaoImpl lecturedao;
	
	
	/**
	 * service
	 * 하는 일
	 * 1. 현재 페이지에 따라 리스트 불러옴
	 * 2. 검색어, 키워드에 따라 바뀜
	 * @param 설명:페이지, 검색어 찾기
	 * @return 페이지정보, 검색한 값, 알맞은 리스트를 hashmap에 담아서 return
	 * */
	@Transactional
	public HashMap<String, Object> getLectureBoard(int currentPage , PageBean pagebean){
		
		HashMap<String, Object> boardInfo = new HashMap<>();
		
		//현재 총 행
		int countOfRow =lecturedao.getRowCount(pagebean);
		
		System.out.println("countOfRow:"+countOfRow);
		
		//행이 0이 아니면 list를 찾음 .
		if(countOfRow!=0) {	
			//페이지 정보 정하기
			pagebean.setPage_andRow(currentPage,countOfRow);
		
			//list구하기
			List<LectureBean> lectureList= lecturedao.getLectureList(pagebean);
			
			//찾은 lectureList 추가
			boardInfo.put("lectureList",lectureList);
		}
		boardInfo.put("page_index", pagebean);
		
		return boardInfo;
		
	}
	
	@Transactional
	public List<LectureBean> getReviewDetail (int lecture_id){
		//강의 정보
		LectureBean lectureInfo = lecturedao.getLectureListById(lecture_id);
		
		//
		List<ReplyBean> replyList = lecturedao.getReplyListById(lecture_id);
		
		return null;
	}
	

}
