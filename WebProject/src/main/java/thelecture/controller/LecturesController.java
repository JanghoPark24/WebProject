package thelecture.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import thelecture.model.BoardBean;
import thelecture.model.MemberBean;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LecturesController {
	
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
	
	

	@RequestMapping(value = "review.do", method = RequestMethod.GET)

	public String review( MemberBean member,BoardBean lecture,Model model){
		
		
		//
		//관리자 일 경우
//		if()
		//일반 유저일 경우
		
		return member.getGrade() =="manager"? "review_manager":"review";
		
	}
	
	@RequestMapping(value="write_review.do")
	public String write_review(String id) {
		
		return "";
	}
	
	
}
