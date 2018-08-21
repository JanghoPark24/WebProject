package thelecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import thelecture.controller.MailHandler;
import thelecture.dao.MemberDaoImpl;
import thelecture.dao.UnivDaoImpl;
import thelecture.model.MemberBean;
import thelecture.security.SHA256;
import thelecture.security.TempKey;

@Service
@Transactional
public class MemberServiceImpl {
	@Autowired
	private MemberDaoImpl memberDao;
	@Autowired
	private UnivDaoImpl univDao;
	@Inject
	private JavaMailSender mailSender;

	private String hostAddress = "localhost";

	// 전체 회원 목록 조희
	public List<MemberBean> memberList() {
		return memberDao.memberList();
	}

	// 회원 정보 상세 조회
	public MemberBean getMember(String email) {
		System.out.println("Service");
		return memberDao.getMember(email);
	}

	// 회원 정보 상세 조회
/*	public MemberBean viewMember(String nickname) {
		System.out.println("Service");
		return memberDao.viewMember(nickname);
	}
*/	public MemberBean viewMember(String nickname) {
		System.out.println("Service");
		 
		return memberDao.viewMember(nickname);
	}

	/**
	 * 중복체크를 하는 메소드입니다.
	 * 
	 * @param column
	 * @param value
	 * @return DB에 해당column에 해당value가 있으면 1을 리턴한다. 그렇지 않으면 0을 리턴한다
	 */
	public boolean isDuplication(String column, String value) throws Exception {
		return memberDao.isDuplication(column, value.toLowerCase());
	}

	/**
	 * 중복체크를 하는 메소드입니다.
	 * 
	 * @param column
	 * @param value
	 * @param caseSensitive가
	 *            true면 대소문자를 구분한다.
	 * @return DB에 해당column에 해당value가 있으면 1을 리턴한다. 그렇지 않으면 0을 리턴한다
	 */
	public boolean isDuplication(String column, String value, boolean caseSensitive) throws Exception {
		return memberDao.isDuplication(column, (caseSensitive) ? value : value.toLowerCase());
	}

	public String find_domain(String domain) throws Exception {
		return univDao.find_domain(domain);

	}

	/**
	 * 멤버 가입
	 * 
	 * @param mb
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public String member_join(String email, String nickname, String password, Model model) throws Exception {
		// 중복확인
		boolean dupemail = isDuplication("email", email);
		boolean dupnickname = isDuplication("nickname", nickname);

		// 등록된 도메인이 아니면 가입거부 창을 띄움
		StringTokenizer st = new StringTokenizer(email, "@");
		st.nextToken();// 첫번째 토큰은 버림 (첫번째 토큰)@(도메인)
		String domain = st.nextToken().trim().toLowerCase();
		String univ_name = find_domain(domain);

		if (!dupemail && !dupnickname// DB(member)안에 중복 이메일, 중복 닉네임이 없으면,
				&& (!univ_name.equals("")) /* DB(univ)안에 도메인이 있으면, */ ) {

			// 서버 아이피
			/* InetAddress ip = InetAddress.getLocalHost(); */

			// 인증용 랜덤키 생성
			TempKey keyGenerator = TempKey.Instance;
			boolean dupkey = false;
			String reg_key;
			do {
				reg_key = keyGenerator.getKey(20, false);
				dupkey = isDuplication("reg_key", reg_key, true);
			} while (dupkey);// 인증키 충돌할경우 다시 생성한다.

			// 이메일 전송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[TheLecture]회원가입 인증메일입니다.");
			sendMail.setText(new StringBuffer().append(
					"<div class='container' style='padding: 20px;background: #eeeeee;font-size:16px;border: 1px solid #999999;'>")//
					.append("<div class='jumbotron' style='margin: 20px;background: #eeeeee;'>")//
					.append("<h2>회원가입 메일 인증</h2>" + "<span style='font-size: 18px; font-weight: 500;'>안녕하세요.  ")//
					.append(nickname)// 닉네임
					.append(" 님,</span><br><br>TheLecture 가입을 환영합니다.<br>시작하기 전에, 본인 확인을 위해 이메일 인증이 필요합니다.<br>")//
					.append("아래의 이메일 인증 주소를 클릭해주세요:<br><br><a class='btn' href='")//
					.append("http://localhost/WebProject/email_confirm.do?key=")// 가입 인증 url주소
					.append(reg_key)// 인증키값
					.append("' style='color:white;text-decoration:none;font-size:14px;border-radius:3px;background-color:#337ab7;padding:8px 12px;border:none'>이메일 인증</a>")//
					.append("<br><p style='font-size:12px;color:#444444'><br><a href='http://").append(hostAddress)//
					.append("/WebProject/home.do'style='text-decoration: none; color: #333;'target='_blank';>TheLecture</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/tos.do'style='text-decoration: none; color: #333;'target='_blank';>이용약관</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/privacy.do'style='text-decoration: none; color: #333;'target='_blank';>개인정보 처리방침</a> / <br></p></div></div>")
					.toString());//
			sendMail.setFrom("TheLectue.corp@gmail.com", "TheLectue.corp");//
			sendMail.setTo(email);
			sendMail.send();// 메일 전송

			// SHA256 (해쉬화)
			SHA256 encrypter = SHA256.Instance;
			String hashed_text = encrypter.encrypt(password).toLowerCase();
			/* 향후 개선점 : SHA방식에 소금치는 방법을 추가하면 더 낫다. */
			/* 스프링 시큐리티의 Bcrypt 방식이 더 낫다. */

			// 멤버빈 주입
			MemberBean mb = new MemberBean();
			mb.setEmail(email.trim());
			mb.setNickname(nickname.trim());
			mb.setUniv_name(univ_name);
			mb.setReg_key(reg_key);
			mb.setPassword(hashed_text);
			memberDao.member_join(mb);

		} else {// 중복 아이디 또는 중복 이메일
			if (dupemail)
				model.addAttribute("dupemail", dupemail);
			if (dupnickname)
				model.addAttribute("dupnickname", dupnickname);
			return "member/joinForm";

		}
		return "redirect:reg_info.do";

	}

	/**
	 * 패스워드를 변경하기 위한 이메일 전송
	 * 
	 * @param email
	 */
	public String request_reset_password(String email, Model model) throws Exception {
		boolean dupemail = isDuplication("email", email);
		if (dupemail) {// 이메일 계정이 존재함
			MemberBean mb = memberDao.select_member(email);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[TheLecture]비밀번호 재설정 메일입니다.");
			sendMail.setText(new StringBuffer().append(
					"<div class='container' style='padding: 20px;background: #eeeeee;font-size:16px;border: 1px solid #999999;'>")//
					.append("<div class='jumbotron' style='margin: 20px;background: #eeeeee;'>")//
					.append("<h2>비밀번호 재설정</h2>" + "<span style='font-size: 18px; font-weight: 500;'>안녕하세요.  ")//
					.append(mb.getNickname())// 닉네임
					.append(" 님,</span><br><br>비밀번호 재설정을 하기 위해서 아래의 주소를 클릭해주세요<br>")//
					.append("본인이 요청한 메일이 아닌 경우, 개인정보 보호를 위해 비밀번호를 다시 설정하시길 바랍니다.:<br><br><a class='btn' href='")//
					.append("http://localhost/WebProject/passwordForm.do?key=")// 가입 인증 url주소
					.append(mb.getReg_key())// 인증키값
					.append("' style='color:white;text-decoration:none;font-size:14px;border-radius:3px;background-color:#337ab7;padding:8px 12px;border:none'>비밀번호 재설정</a>")//
					.append("<br><p style='font-size:12px;color:#444444'><br><a href='http://").append(hostAddress)//
					.append("/WebProject/home.do'style='text-decoration: none; color: #333;'target='_blank';>TheLecture</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/tos.do'style='text-decoration: none; color: #333;'target='_blank';>이용약관</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/privacy.do'style='text-decoration: none; color: #333;'target='_blank';>개인정보 처리방침</a> / <br></p></div></div>")
					.toString());//
			sendMail.setFrom("TheLectue.corp@gmail.com", "TheLectue.corp");//
			sendMail.setTo(email);
			sendMail.send();// 메일 전송
			System.out.println("메일전송");
			return "redirect:loginForm.do";
		}
		System.out.println("메일전송실패");
		model.addAttribute("err_msg", "유효하지 않은 이메일");
		return "member/find_passwordForm";

	}

	/**
	 * 비밀번호 변경
	 */
	public String reset_password(String reg_key, String password, Model model) throws Exception {
		String email = memberDao.getEmail(reg_key);
		if (email != null) {// 유효함
			if (!email.toLowerCase().equals("thelecture.corp@gmail.com")) {
				// SHA256 (해쉬화)
				SHA256 encrypter = SHA256.Instance;
				String hashed_text = encrypter.encrypt(password).toLowerCase();
				MemberBean mb = memberDao.select_member(email);
				mb.setPassword(hashed_text);
				memberDao.member_reset_password(mb);
				return "redirect:home.do";
			}
		}
		model.addAttribute("err_msg", "유효하지 않음");
		return "redirect:home.do";
	}

	/**
	 * 멤버 로그인
	 * 
	 * @throws Exception
	 */
	@Transactional
	public ModelAndView member_login(String email, String password, HttpSession session, Model model) throws Exception {

		// SHA256 (해쉬화)
		SHA256 encrypter = SHA256.Instance;
		String hashed_text = encrypter.encrypt(password).toLowerCase();

		MemberBean mb = (MemberBean) select_member(email);

		if (mb != null) {// member테이블에 email이 존재함
			if (hashed_text.equals(mb.getPassword())) {// 비밀번호해쉬값이 일치함
				session.setAttribute("email", email);
				session.setAttribute("univ_name", mb.getUniv_name());
				session.setAttribute("nickname", mb.getNickname());
				String grade = mb.getGrade();
				ModelAndView loginM;
				if (grade.equals("unknown")) {// grade가 "unknown"이면
					loginM = new ModelAndView("member/reg_info");
				} else {// 정상적으로 로그인
					loginM = new ModelAndView("content/home");
				}
				session.setAttribute("grade", grade);
				return loginM;
			}
		}
		model.addAttribute("err_msg", "로그인 실패");
		// 로그인 실패
		return new ModelAndView("member/loginForm");
	}

	public MemberBean select_member(String email) throws Exception {
		return memberDao.select_member(email);
	}

	@Transactional
	// 회원정보수정
	public int member_update(MemberBean mb) throws Exception {
		
		return memberDao.member_update(mb);

	}
	@Transactional
	// 회원정보수정
	public boolean member_update_profile(MemberBean mb) throws Exception {
		boolean profileUpdateSuccess = memberDao.member_update_profile(mb);
		boolean imageInsertSuccess = memberDao.insertProfile(mb);
		
		return profileUpdateSuccess && imageInsertSuccess;

	}
	
	

	public String email_confirm(String reg_key) throws Exception {
		String email = memberDao.getEmail(reg_key);
		if (email != null) {// 유효함
			memberDao.setGrade_to("member", email);
			return "redirect:home.do";
		}
		return "redirect:home.do";// 유효하지 않음
	}

	public MemberBean getMemberByNickName(String nickname) {
		
		return memberDao.getMemberByNickName(nickname);
	}

}
