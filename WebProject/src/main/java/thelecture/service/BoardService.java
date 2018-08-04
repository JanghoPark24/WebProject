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
	
	
	
	@Transactional
	public HashMap<String, Object> getLectureBoard(int currentPage , String search, String keyword){
		
		HashMap<String, Object> boardInfo = new HashMap<>();
		
		//현재 총 페이지수
		
		int countOfRow = lecturedao.getRowCount();
		//페이지 당 줄 개수
		int rowPerPage = 10;
		
		PageBean page_index = new PageBean(currentPage, rowPerPage, countOfRow);
		
		//search와 keyword추가
		page_index.setKeyword(keyword);
		page_index.setSearch(search);
			
		if(countOfRow==0 || currentPage >page_index.getLastIndex() ) return null;
		
		
		//list구하기
		List<LectureBean>
		lectureList= lecturedao.getLectureList(page_index);
		
		System.out.println(page_index.getCurrentPage());
		
		System.out.println("firstrow:"+page_index.getStartRow());
		System.out.println("endrow:"+page_index.getEndRow());
		System.out.println("");
		//index 추가
		boardInfo.put("page_index", page_index);
		boardInfo.put("lectureList",lectureList);
		
		
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
