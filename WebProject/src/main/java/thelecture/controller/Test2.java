package thelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Test2 {
	
	@RequestMapping("lectureList.do")
	public String test2() {		
	
		System.out.println("lectureList");
		return "content/lecture/lectureList";
	}
	
}
