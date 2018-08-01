package thelecture.service;

import java.net.InetAddress;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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

	// 전체 회원 목록 조희
	public List<MemberBean> memberList() {
		return memberDao.memberList();
	}

	// 회원 정보 상세 조회
	public MemberBean viewMember(String nickname) {
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
	public int isDuplication(String column, String value) throws Exception {
		int result = memberDao.isDuplication(column, value.toLowerCase());
		return result;
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
	public int isDuplication(String column, String value, boolean caseSensitive) throws Exception {
		int result = memberDao.isDuplication(column, (caseSensitive) ? value : value.toLowerCase());
		return result;
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
		int dupemail = isDuplication("email", email);
		int dupnickname = isDuplication("nickname", nickname);

		// 등록된 도메인이 아니면 가입거부 창을 띄움
		StringTokenizer st = new StringTokenizer(email, "@");
		st.nextToken();// 첫번째 토큰은 버림 (첫번째 토큰)@(도메인)
		String domain = st.nextToken().trim().toLowerCase();
		System.out.println("domain : " + domain);
		String univ_name = find_domain(domain);
		System.out.println("univ_name : " + univ_name);

		if ((dupemail + dupnickname == 0)// DB(member)안에 중복 이메일, 중복 닉네임이 없으면,
				&& (!univ_name.equals("")) /* DB(univ)안에 도메인이 있으면, */ ) {

			// 서버 아이피
			/* InetAddress ip = InetAddress.getLocalHost(); */

			// 인증용 랜덤키 생성
			TempKey keyGenerator = TempKey.Instance;
			int dupkey = 1;
			String reg_key;
			do {
				reg_key = keyGenerator.getKey(20, false);
				dupkey = isDuplication("reg_key", reg_key, true);
			} while (dupkey != 0);// 인증키 충돌할경우 다시 생성한다.

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
					.append("<p style='font-size:12px;color:#444444'><a href='http://").append("localhost")// ip.getHostAddress())
					.append("/WebProject/home.do'style='text-decoration: none; color: #009'>TheLecture</a>에서 보낸 메일<br></p></div></div>")
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
			if (dupemail != 0)
				model.addAttribute("dupemail", dupemail);
			if (dupnickname != 0)
				model.addAttribute("dupnickname", dupnickname);
			return "join_form";

		}
		return "redirect:reg_info.do";

	}

	/**
	 * 멤버 로그인
	 * 
	 * @throws Exception
	 */
	@Transactional
	public ModelAndView member_login(String email, String password, HttpServletResponse response, HttpSession session)
			throws Exception {

		// SHA256 (해쉬화)
		SHA256 encrypter = SHA256.Instance;
		String hashed_text = encrypter.encrypt(password).toLowerCase();
		System.out.println(hashed_text);

		MemberBean mb = (MemberBean) select_member(email);

		if (mb != null) {// member테이블에 email이 존재함
			if (hashed_text.equals(mb.getPassword())) {// 비밀번호해쉬값이 일치함
				session.setAttribute("email", email);
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
		session.setAttribute("err_msg", "로그인 실패");
		// 로그인 실패
		return new ModelAndView("member/login_form");
	}

	public MemberBean select_member(String email) throws Exception {
		return memberDao.select_member(email.toLowerCase());
	}
	
	//회원정보수정
	  public int member_update(MemberBean mb) throws Exception {
	  System.out.println("2");
		  return memberDao.member_update(mb);
		  
		 }
	 

	public String email_confirm(String reg_key) throws Exception {
		String email = (String) memberDao.getEmail(reg_key);
		if (email != null) {// 유효함

			return "redirect:home.do";
		}
		return "redirect:home.do";// 유효하지 않음
	}

}
