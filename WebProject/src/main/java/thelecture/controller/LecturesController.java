package thelecture.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.dao.LectureDaoImpl;
import thelecture.dao.MemberDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.MemberBean;
import thelecture.model.PageBean;
import thelecture.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LecturesController {
	
	@Autowired
	MemberDaoImpl memberdao;
	
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(LecturesController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home2.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "home2";
	}
	
	
	/**
	 *  
	 * 하는 일 :
	 *  1.lectureList정보 불러오기 (1) 페이징 기능, 리스트 정보
	 *  2.detail로 들어가는 기능
	 * 	3.검색기능	 
	 * @param 설명 : session, view로 정보를 전하는 model, 현재 페이지,  검색어, 검색키워드
	 * @return session의 grade가 master면 lecture_master경로, 아니면 lectureList경로 리턴
	 * @author Jonghyeok
	 * */
	@RequestMapping(value = "/lectureList.do")
	public String lectureList( HttpSession session, Model model,Integer currentPage, String search, String keyword) {
		
		
		//현재 페이지 불러오기
		if(currentPage ==null) currentPage=1;
		
		System.out.println(search);
		System.out.println(keyword);
		
		HashMap<String, Object> boardInfo=null;
		
		//get List Info -search가 있으면 
		
		boardInfo = boardService.getLectureBoard(currentPage, search, keyword);
		
		//다음으로 전하기
		model.addAllAttributes(boardInfo); // page_index, lectureList 전달
		
		//grade가 master면 마스터 모드 아니면 일반 모드
		String grade = (String)session.getAttribute("grade");

		return grade!=null && grade.equals("master")? 
				"content/lecture/lecture_master":
				"content/lecture/lectureList";
		
	}
	
	
	/**
	 * review detail정보 불러오기 :
	 *  1. id에 따라 게시판 정보 불러옴.
	 * @param 설명
	 * @return 
	 * */
	@RequestMapping(value = "review.do", method = RequestMethod.GET)

	public String review(String lecture_id, HttpSession session,Model model){
		
		//password가 맞으면
		boardService.getReviewDetail(Integer.parseInt(lecture_id));
		model.addAttribute("checked",true);
		
		return "lecture/review/d";
				
		
	}
	
	@RequestMapping(value="write_review.do")
	public String write_review(String id) {
		
		return "";
	}
	
	@RequestMapping(value="insertLectureView.do")
	public String insert_lecture_view(HttpSession session) {
		
		if(!session.getAttribute("grade").equals("master")) return "isNotMaster//e";
		
		else return "content/lecture/insert_lecture_view";
	}
	@RequestMapping(value="insertLecture.do")
	public String insert_lecture(String id) {
		
		return "";
	}
	
	
}
