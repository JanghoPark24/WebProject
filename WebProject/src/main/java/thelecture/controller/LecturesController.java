package thelecture.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import thelecture.dao.LectureDaoImpl;
import thelecture.dao.MemberDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.MemberBean;

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
	
	@RequestMapping(value = "lectureList.do", method = RequestMethod.GET)
	public String lectureList( HttpSession session, Model model,Integer currentPage) {
		
		
		//현재 페이지 불러오기
		if(currentPage ==null) currentPage=1;
		int rowPerPage = 10;
		
//		Page pageInfo = new Page(currentPage, rowPerPage);
		
		
		
		//lecture 불러오기
		List<LectureBean> lectureList=null;
		
		//get indexes
		Hashtable board = boardService.getLectureBoard(currentPage);
		
//		lectureList = lecturedao.getlectureList();
		//다음으로 전하기
		model.addAllAttributes(board);
			
		
		//grade가 master면 마스터 모드 아니면 일반 모드
		String grade = (String)session.getAttribute("grade");

		return grade!=null && grade.equals("master")? 
				"content/lecture/lecture_master":
				"content/lecture/lectureList";
		
	}
	
	
	
	
	
	@RequestMapping(value = "review.do", method = RequestMethod.GET)

	public String review( MemberBean member,LectureBean lecture,Model model){
		
		//password가 맞으면
		
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
