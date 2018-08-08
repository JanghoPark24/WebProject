package thelecture.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.LectureDaoImpl;
import thelecture.info.BoardInfo;
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
	public HashMap<String, Object> getLectureBoard(int currentPage , String search, String keyword){
		
		HashMap<String, Object> boardInfo = new HashMap<>();
		
		//현재 총 행
		int countOfRow;
		
		//keyword,search가 없으면 전체 행
		if(keyword==null && search==null) countOfRow=lecturedao.getRowCount();
		//keyword,search가 있으면 검색어를 포함한 행
		else countOfRow =lecturedao.getSearchRowCount(search,keyword);
		
		System.out.println("countOfRow:"+countOfRow);
		
		//행이 0개이면 찾을 것 없이 돌려보냄.
		if(countOfRow==0) return null;	
		
		//페이지 당 줄 개수
		int rowPerPage = BoardInfo.rowPerPage;
		
		//페이지 정보 정하기
		PageBean page_index = new PageBean(currentPage, rowPerPage,countOfRow);
		
		//2.search와 keyword추가
		page_index.setKeyword(keyword);
		page_index.setSearch(search);
			
		
		//list구하기
		List<LectureBean> lectureList= lecturedao.getLectureList(page_index);
		
		
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
