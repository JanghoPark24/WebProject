package thelecture.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import thelecture.model.MemberBean;
import thelecture.security.SHA256;
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
			TempKey keyGenerator = TempKey.Instance;
			int dupkey;
			String reg_key;
			do {
				reg_key = keyGenerator.getKey(20, false);
				dupkey = memberService.isDuplication("reg_key", reg_key, true);
			} while (dupkey != 0);// 인증키 충돌할경우 다시 생성한다.

			// SHA256 (해쉬화)
			SHA256 encrypter = SHA256.Instance;
			String hashed_text = encrypter.encrypt(password).toUpperCase();
			/* 향후 개선점 : SHA방식에 소금치는 방법을 추가하면 더 낫다. */

			// 멤버빈 주입
			MemberBean mb = new MemberBean();
			mb.setEmail(email.trim());
			mb.setNickname(nickname.trim());
			mb.setUniv_name(univ_name);
			mb.setReg_key(reg_key);
			mb.setPassword(hashed_text);
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
	public String loginForm(HttpSession session) {
		if (session.getAttribute("grade") != null) {// 이미 로그인한 유저가 다시 이 주소로 왔을 경우
			return "redirect:home.do";
		}
		return "login_form";
	}

	/**
	 * 로그인 버튼을 눌러서 로그인 시도
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("로그인시도 \n email:" + email + "password:" + password);
		response.setContentType("text/html;charset=UTF-8");
		MemberBean mb = this.memberService.select_member(email);
		// SHA256 (해쉬화)
		SHA256 encrypter = SHA256.Instance;
		String hashed_text = encrypter.encrypt(password).toUpperCase();

		PrintWriter out = response.getWriter();// 출력스트림 객체 생성
		System.out.println(hashed_text);

		if (mb == null) {// member테이블에 email이 존재하지 않음
			out.println("<script>");
			out.println("alert('등록되지 않은 회원입니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			System.out.println(mb.getPassword());
			if (hashed_text.equals(mb.getPassword())) {// 비밀번호해쉬값이 일치함
				session.setAttribute("email", email);
				session.setAttribute("nickname", mb.getNickname());
				String grade = mb.getGrade();
				ModelAndView loginM;
				if (grade.equals("unknown")) {// grade가 "unknown"이면
					loginM = new ModelAndView("member/reg_info");
				} else {
					loginM = new ModelAndView("content/home");
				}
				session.setAttribute("grade", grade);
				return loginM;
			} else {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}
		return null;
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

	/*
	 * @RequestMapping("update.do") public String update(@ModelAttribute MemberBean
	 * mb) throws Exception { memberService.member_update(mb);
	 * 
	 * return "profile.do"; }
	 */
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

}