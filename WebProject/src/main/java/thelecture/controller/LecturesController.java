package thelecture.controller;

import java.text.DateFormat;
import java.util.Date;
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
import thelecture.model.BoardBean;
import thelecture.model.MemberBean;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LecturesController {
	
	@Autowired
	MemberDaoImpl memberdao;
	
	@Autowired
	LectureDaoImpl lecturedao;
	
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
	public String lectureList( String email, BoardBean lecture,Model model){
	
		//불러온 email로 계정 정보 불러옴
//		MemberBean member = memberdao.getMemberInfo(email);
		
		
		
		return "content/lecture/lectureList";
		
	}
	
	@RequestMapping(value = "lecture_master.do", method = RequestMethod.GET)
	public String lecture_master(HttpSession session,String password, BoardBean lecture,Model model){
		
		String grade = (String)session.getAttribute("grade");
		
		if(grade =="master") {
			
			return "content/lecture/lecture_master";
			
		}else {
			return "error/isNotMaster";
			
		}
		
	}
	
	
	
	@RequestMapping(value = "review.do", method = RequestMethod.GET)

	public String review( MemberBean member,BoardBean lecture,Model model){
		
		//password가 맞으면
		
		model.addAttribute("checked",true);
		
		return "lecture/review/d";
				
		
	}
	
	@RequestMapping(value="write_review.do")
	public String write_review(String id) {
		
		return "";
	}
	
	
}
