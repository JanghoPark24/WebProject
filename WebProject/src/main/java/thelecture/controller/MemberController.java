package thelecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.MemberBean;
import thelecture.service.MemberServiceImpl;

/**
 *
 * 회원 컨트롤러
 */
@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;

	/**
	 * 회원 가입하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("joinForm.do")
	public String joinForm(Model model) {
		return "join_form";
	}

	/**
	 * 회원 가입 버튼을 눌러서 가입 시도
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@RequestParam("email") String email, @RequestParam("nickname") String nickname,
			@RequestParam("password") String password, Model model) throws Exception {

		int dupemail = memberService.is_dup_email(email);
		int dupnickname = memberService.is_dup_nickname(nickname);
		if (dupemail+dupnickname ==0) {
			/*
			 * DB에서 도메인 탐색하여 비교하는 과정 필요
			 * 등록된 도메인이 아니면 가입거부 창을 띄워야함
			 * 
			 */
			MemberBean mb = new MemberBean();
			mb.setEmail(email.trim());
			mb.setNickname(nickname.trim());
			memberService.member_join(mb);
			
		}else {//중복 아이디 또는 중복 이메일
			if(dupemail!=0)model.addAttribute("dupemail", dupemail);
			if(dupnickname!=0)	model.addAttribute("dupnickname", dupnickname);
			return "join_form";
		}
		return "redirect:reg_info.do";
	}

	/**
	 * 로그인하기 위한 form이 있는 곳으로 이동
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
	 * 비밀번호를 재설정 하기 위한 form으로 이동
	 */
	@RequestMapping("resetPasswd.do")
	public String resetPasswd() {
		return "reset_passwd";
	}

	/**
	 * 이메일 등록하라는 안내
	 */
	@RequestMapping("reg_info.do")
	public String reg_info() {
		return "reg_info";
	}

	/**
	 *   내회원정보 창
	 */
	/*@RequestMapping("user_profile.do")
	public String user_profile(@ModelAttribute MemberBean mb) throws Exception {
		memberService.member_update(mb);
		
		return "user_profile";
	}
*/
	/*@RequestMapping("my_profile.do")
	public String my_profile(@ModelAttribute MemberBean mb) throws Exception {
	//	memberService.member_update(mb);
		
		return "my_profile";
	}
	*/

/*	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberBean mb) throws Exception {
		memberService.member_update(mb);
		
		return "profile.do";
	}
*/
	// 회원목록 조회
	@RequestMapping("profile.do")
	public String memberList(Model model) { 
	List<MemberBean> list = memberService.memberList();
	model.addAttribute("list",list);
	
	System.out.println("리스트 ==> " + list.toString());
	return "profilelist";
	}
	
	// 회원 상세정보 조회
    @RequestMapping("my_profile.do")
    public String memberView(/*@RequestParam("nickname") String nickname,*/ Model model) {
    	/*System.out.println(nickname);*/
    		String nickname="11";
    	MemberBean dto = memberService.viewMember(nickname);
    	model.addAttribute("dto",dto);
    	
        return "my_profile";
    	
    }
	
}