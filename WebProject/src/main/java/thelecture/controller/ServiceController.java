package thelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ServiceController {
	
	@RequestMapping("service_profile.do")
	public String service() {		
	
		System.out.println("service_profile");
		return "service_profile";
	}
	
}
