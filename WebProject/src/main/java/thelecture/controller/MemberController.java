package thelecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import thelecture.service.MemberServiceImpl;

/**
 * @author Administrator
 *
 */
@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	/**
	 * 회원 가입하기 위한 양식이 있는 곳으로 이동
	 */
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "join_form";
	}

	/**
	 * 회원 가입 버튼을 눌러서 가입 시도
	 */
	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String join(String email) throws Exception {
		
		int result = memberService.member_dup_check(email);

		System.out.println("authcode : "+result);
		
		return "join_form";
	}

	/**
	 * 로그인하기 위한 양식이 있는 곳으로 이동
	 */
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "login_form";
	}

	/**
	 * 로그인 버튼을 눌러서 로그인 시도
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login() {
		return "login";
	}

	/**
	 * 
	 */
	@RequestMapping("resetPasswd.do")
	public String resetPasswd() {
		return "reset_passwd";
	}
}