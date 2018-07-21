package thelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("joinForm.do")
	public String joinForm() {
		System.out.println("joinForm");
		return "join_form";
	}

	@RequestMapping("join.do")
	public String join() {
		System.out.println("join");
		return "join_form";
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("loginForm");
		return "login_form";
	}

	@RequestMapping("login.do")
	public String login() {
		System.out.println("login");
		return "login";
	}

	@RequestMapping("resetPasswd.do")
	public String resetPasswd() {
		System.out.println("resetPasswd");
		return "reset_passwd";
	}
}