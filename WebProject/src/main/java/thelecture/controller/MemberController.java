package thelecture.controller;


import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.MemberBean;
import thelecture.security.TempKey;
import thelecture.service.MemberServiceImpl;
import thelecture.service.UnivServiceImpl;


@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private UnivServiceImpl univService;

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

		int dupemail = memberService.isDuplication("email", email);
		int dupnickname = memberService.isDuplication("nickname", nickname);

		// DB에서 도메인 탐색하여 비교하는 과정
		// 등록된 도메인이 아니면 가입거부 창을 띄워야함
		StringTokenizer st = new StringTokenizer(email, "@");
		st.nextToken();// 첫번째 토큰은 버림 (첫번째 토큰)@(도메인)
		String domain = st.nextToken().trim().toUpperCase();
		System.out.println("domain : " + domain);
		String univ_name = univService.find_domain(domain);
		System.out.println("univ_name : " + univ_name);

		if ((dupemail + dupnickname == 0)// DB(member)안에 중복 이메일, 중복 닉네임이 없으면,
				&& (!univ_name.equals("")) /* DB(univ)안에 도메인이 있으면, */ ) {

			// 인증용 랜덤키 생성
			TempKey tk = TempKey.Instance;
			String reg_key = tk.getKey(20, false);

			// 멤버빈 주입
			MemberBean mb = new MemberBean();
			mb.setEmail(email.trim());
			mb.setNickname(nickname.trim());
			mb.setUniv_name(univ_name);
			mb.setReg_key(reg_key);
			memberService.member_join(mb);

		} else {// 중복 아이디 또는 중복 이메일
			if (dupemail != 0)
				model.addAttribute("dupemail", dupemail);
			if (dupnickname != 0)
				model.addAttribute("dupnickname", dupnickname);
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
	 * 이메일 인증
	 */
	@RequestMapping("email_confirm.do")
	public String email_confirm() {
		return "redirect:home.do";
	}
/*	
 * @RequestMapping("update.do")
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