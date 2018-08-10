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
import thelecture.model.QuestionBean;
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
	public String lectureList( HttpSession session, Model model,PageBean pagebean) {
		
		
		//현재 페이지 불러오기
		Integer currentPage = pagebean.getCurrentPage();
		
		if (currentPage==0) currentPage =1;
		
		HashMap<String, Object> boardInfo=null;
		
		//get List Info -search가 있으면 
		
		boardInfo = boardService.getLectureBoard(currentPage, pagebean);
		
		//보드 정보 다음으로 전하기
		model.addAllAttributes(boardInfo); // page_index, lectureList 전달
		

		return "content/lecture/lectureList";
		
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
	public String insert_lecture_view(HttpSession session,Model model) {
		
		if(!session.getAttribute("grade").equals("master")) return "isNotMaster//e";
		
		List<String> questionVersions = boardService.getQuestionVersions();
		
		System.out.println("questionVersions:"+ questionVersions);
		model.addAttribute("questionVersions",questionVersions);
		
		
		return "content/lecture/insert_lecture_view";
	}
	
	@RequestMapping(value="insertLecture.do")
	public String insert_lecture(String id) {
	
		return "";
	}
	
	@RequestMapping(value="insertQuestion.do")
	//충돌을 막기위해 qustion type으로 question버전을 받는다.(questionList안에 question_version이 있기 때문)
	public String insert_question(@RequestParam("question_type")String question_version, @RequestParam(value="questionContents[]")String []questionContents) {
		
		
		int result =boardService.insertQuestion(question_version, questionContents);
		
		//0이 성공 1이 실패  -성공시 view화면으로
		return result == 0? "redirect:insertLectureView.do":"404error//e";
	}
	@RequestMapping(value="deleteQuestion.do")
	public String delete_question(String question_version,Model model) {
		System.out.println(question_version);
		
		int result = boardService.deleteQuestion(question_version);
		
		return result==0?"redirect:insertLectureView.do" : "404error//e";
	}
	
	
}
