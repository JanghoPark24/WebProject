package thelecture.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;

import thelecture.model.MemberBean;
import thelecture.service.MemberServiceImpl;
import thelecture.util.S3Util;
import thelecture.util.UploadFileUtils;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;

	/**
	 * 회원 가입하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("joinForm.do")
	public String joinForm(Model model) {
		return "member/joinForm";
	}

	/**
	 * 회원 가입 버튼을 눌러서 가입 시도
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@RequestParam("email") String email, @RequestParam("nickname") String nickname,
			@RequestParam("password") String password, Model model) throws Exception {
		return memberService.member_join(email, nickname, password, model);
	}

	/**
	 * 로그인하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("loginForm.do")
	public String loginForm(HttpSession session) {
		if (session.getAttribute("grade") != null) {// 이미 로그인한 유저가 다시 이 주소로 왔을 경우
			return "redirect:home.do";
		}
		return "member/loginForm";
	}

	/**
	 * 로그인 버튼을 눌러서 로그인 시도
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session, Model model) throws Exception {
		return this.memberService.member_login(email, password, session, model);
	}

	/**
	 * 비밀번호를 재설정 이메일을 전송 하기 위한 form으로 이동
	 */
	@RequestMapping("findPasswordForm.do")
	public String findPasswordForm() {
		return "member/find_passwordForm";
	}

	/**
	 * 비밀번호 재설정 메일 전송
	 */
	@RequestMapping(value = "request_reset_password.do", method = RequestMethod.POST)
	public String request_reset_password(@RequestParam("email") String email, Model model) throws Exception {
		return memberService.request_reset_password(email, model);
	}

	/**
	 * 비밀번호 변경 form으로 이동
	 */
	@RequestMapping(value = "passwordForm.do", method = RequestMethod.GET)
	public String passwordForm(String key, Model model) throws Exception {
		model.addAttribute("reg_key", key);
		return "member/passwordForm";
	}

	/**
	 * 비밀번호 변경
	 */
	@RequestMapping(value = "reset_password.do", method = RequestMethod.POST)
	public String reset_password(@RequestParam("authenticity_token") String authenticity_token,
			@RequestParam("password") String password, Model model) throws Exception {
		return memberService.reset_password(authenticity_token, password, model);
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
	@RequestMapping(value = "email_confirm.do", method = RequestMethod.GET)
	public String email_confirm(String key, Model model) throws Exception {
		// 멤버권한 부여
		return memberService.email_confirm(key);
	}

	/**
	 * 로그 아웃
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("email", null);
		session.setAttribute("univ_name", null);
		session.setAttribute("nickname", null);
		session.setAttribute("grade", null);

		return "redirect:home.do";
	}

	/**
	 * 탈퇴 신청 (미구현)
	 */
	@RequestMapping(value = "drop_out.do", method = RequestMethod.POST)
	public String request(HttpSession session) {
		String grade = (String) session.getAttribute("grade");
		if (grade.equals("master")) {// 마스터 등급이면 누구든 삭제가능

		}

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
		String nickname = (String) session.getAttribute("nickname");
		System.out.println("nickname:" + nickname);

		MemberBean dto = memberService.getMemberByNickName(nickname);
		model.addAttribute("dto", dto);

		return "content/profile/my_profile";

	}

	// 유저 페이지
	@RequestMapping("user_profile.do")
	public String user1() {
		return "user_profile";

	}

	// 회원정보 수정
	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberBean mb, HttpSession session) throws Exception {

		// 이메일 저장 -- null값을 막기 위함
		mb.setEmail((String) session.getAttribute("email"));

		int result = memberService.member_update(mb);
		System.out.println("result:" + result);
		session.setAttribute("dto", mb);
		return "redirect:my_profile.do";
	}

	// 파일 업로드
	@RequestMapping("fileupload.do")
	public String fileupload(@ModelAttribute MemberBean mb, MultipartHttpServletRequest request, HttpSession session)
			throws Exception {

		MultipartFile mf = request.getFile("profileImg");
		String path = request.getRealPath("images");
		System.out.println(path);
		String filename = mf.getOriginalFilename();
		File uploadFile = new File(path + "//" + filename);

		System.out.println(filename);
		try {
			mf.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mb.setProfile_img(filename);
		mb.setEmail(session.getAttribute("email").toString());
		/*
		 * mb.setEmail(request.getParameter("email"));
		 * mb.setUniv_name(request.getParameter("univ_name"));
		 * mb.setNickname(request.getParameter("nickname"));
		 * mb.setProfile(request.getParameter("profile"));
		 */

		memberService.member_update(mb);

		session.setAttribute("myprofile", mb);
		/*
		 * session.setAttribute("nickname", mb.getNickname());
		 */
		return "redirect:my_profile.do";
	}

	@RequestMapping("fileupload2.do")
	public String fileupload2(@ModelAttribute MemberBean mb, @RequestParam("profileImg") MultipartFile mf,
			HttpSession session, Model model) throws Exception {

		String directory = "profileImage";
		System.out.println(directory);
		String filename = mf.getOriginalFilename();
		String current_email = (String) session.getAttribute("email");

		System.out.println(filename);
		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtils.uploadFile(directory, filename, mf.getBytes()), HttpStatus.CREATED);
		String uploadedFile = img_path.getBody();

		mb.setProfile_img(filename);
		mb.setEmail(current_email);
		mb.setUploadedFile(uploadedFile);
		mb.setDirectory(directory);

		// member에 profile, file_storage에 이미지와 경로 저장
		boolean updateProfileSuccess = memberService.member_update_profile(mb);

		model.addAttribute("dto", mb);
		// session.setAttribute("userImage", current_email+filename);

		return (updateProfileSuccess) ? "redirect:my_profile.do" : "updateFail//e";
	}
}