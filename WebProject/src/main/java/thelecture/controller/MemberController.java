package thelecture.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import thelecture.model.MemberBean;
import thelecture.service.MemberServiceImpl;

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
		return memberService.member_join(email, nickname,password, model);
	}

	/**
	 * 로그인하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("loginForm.do")
	public String loginForm(HttpSession session) {
		if (session.getAttribute("grade") != null) {// 이미 로그인한 유저가 다시 이 주소로 왔을 경우
			return "redirect:home.do";
		}
		return "login_form";
	}

	/**
	 * 로그인 버튼을 눌러서 로그인 시도
	 * @throws Exception 
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session) throws Exception   {
		return this.memberService.member_login(email, password, response, session);
	}

	/**
	 * 비밀번호를 재설정 하기 위한 form으로 이동
	 */
	@RequestMapping("resetPasswd.do")
	public String resetPasswd() {
		return "member/reset_passwd";
	}

	/**
	 * 이메일 등록하라는 안내
	 */
	@RequestMapping("reg_info.do")
	public String reg_info() {
		return "member/reg_info";
	}

	/**
	 * 이메일 인증
	 */
	@RequestMapping("email_confirm.do")
	public String email_confirm() {
		return "redirect:home.do";
	}

	/**
	 * 로그 아웃
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}

	/**
	 * 탈퇴 신청
	 */
	@RequestMapping("signOut.do")
	public String request(HttpSession session) {
		session.invalidate();
		return "content/home";
	}

   
	 
	
	// 회원목록 조회
	@RequestMapping("user_list.do")
	public String memberList(Model model) {
		List<MemberBean> list = memberService.memberList();
		model.addAttribute("list", list);

		System.out.println("리스트 ==> " + list.toString());
		return "content/profile/user_list";
	}

	// 회원 상세정보 조회

	@RequestMapping("my_profile.do")
	public String memberView(HttpSession session, Model model) {
		String nickname= (String) session.getAttribute("nickname");
		System.out.println(nickname);

		MemberBean dto = memberService.viewMember(nickname);
		model.addAttribute("dto", dto);

		return "my_profile";

	}

	// 마이 페이지
	@RequestMapping("user_profile.do")
	public String user1() {
		return "user_profile";

	}

	 //회원정보 수정
    @RequestMapping("update.do") 
    public String update(@ModelAttribute MemberBean mb , HttpSession session ) throws Exception { 
    	 System.out.println("1");
    	int result = memberService.member_update(mb);
      	 System.out.println("result:"+result);
    	//  session.setAttribute("mb" , memberService.member_update(mb));  
    
    //회원정보 수정 후 로그아웃해야 반영되는 오류가있음 	
	 return "redirect:logout.do";
	 }
	
}