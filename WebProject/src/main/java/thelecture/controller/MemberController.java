package thelecture.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.MemberBean;
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
	public String join(
			@RequestParam("email") String email,
			@RequestParam("nickname") String nickname,
			@RequestParam("password") String password
			) throws Exception {
		System.out.println(email);
		int authcode = memberService.member_dup_check(email);
		// authcode가 -1이면 중복 이메일이 없다는 뜻
		System.out.println("authcode : " + authcode);
		if (authcode == -1) {
			MemberBean mb = new MemberBean();
			mb.setEmail(email);
			mb.setNickname(nickname);
			System.out.println(mb.getEmail());
			System.out.println(mb.getNickname());
			memberService.member_join(mb);
			System.out.println("memberBean 입력");
			return "redirect:loginForm.do";
		}

		return "redirect:join_form";
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