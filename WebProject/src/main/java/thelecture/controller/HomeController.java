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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "content/home";
	}
	
	@RequestMapping("privacy.do")
	public String privacy() {		
		System.out.println("privacy");
		return "content/privacy";
	}
	@RequestMapping("tos.do")
	public String tos() {		
		System.out.println("tos");
		return "/content/tos";
	}
	@RequestMapping("joinForm.do")
	public String joinForm() {		
		System.out.println("joinForm");
		return "member/join_form";
	}
	@RequestMapping("join.do")
	public String join() {		
		System.out.println("join");
		return "member/join";
	}
	@RequestMapping("loginForm.do")
	public String loginForm() {		
		System.out.println("loginForm");
		return "member/login_form";
	}
	@RequestMapping("login.do")
	public String login() {		
		System.out.println("login");
		return "member/login";
	}
	@RequestMapping("resetPasswd.do")
	public String resetPasswd() {		
		System.out.println("resetPasswd");
		return "member/reset_passwd";
	}
	
}
