package thelecture.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.PageBean;

@Service
public class BoardService {
	
	@Autowired
	LectureDaoImpl lecturedao;
	
	public HashMap<String, Object> getLectureBoard(int currentPage ){
		HashMap<String, Object> boardInfo = new HashMap<>();
		//현재 총 페이지수
		int countOfRow = lecturedao.getRowCount();
		
		
		//페이지 당 줄 개수
		int rowPerPage = 10;
		if(countOfRow==0) return null;
		
		
		PageBean page_index = new PageBean(currentPage, rowPerPage, countOfRow);

		
		//list추가
		List<LectureBean>
			lectureList= lecturedao.getLectureList(page_index);
		
		System.out.println(lectureList);
		//index 추가
		boardInfo.put("page_index", page_index);
		boardInfo.put("lectureList",lectureList);
		
		
		return boardInfo;
		
	}

}
