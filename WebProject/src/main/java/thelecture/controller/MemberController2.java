package thelecture.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.WriteBean;
import thelecture.service.MemberServiceImpl;
import thelecture.service.WriteServiceImple;

@Controller
public class MemberController2 {
	@Autowired
	private WriteServiceImple service;
	
	@Autowired
	private MemberServiceImpl memberService;	

	@RequestMapping("write_manager.do")
	public String write_manager() {
		return "write_manager";

	}

	@RequestMapping("write.do")			/*세션을 로그인된 사람만 글작성*/
	public String insert(@ModelAttribute WriteBean WriteBean, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		System.out.println(email);
		WriteBean.setEmail(email);
		int result = service.insert(WriteBean);
		model.addAttribute("result", result);
		return "writeAction";
	}
	
	
	
	

	@RequestMapping("wlist.do")	/*리스트 페이지*/
	public String list(Model model) {
		int count = service.count();
		List<WriteBean> list = service.list();
		model.addAttribute("count", count);
		model.addAttribute("list", list);

		return "wlist";
	}

	@RequestMapping("read.do") /*게시글 읽기 페이지*/
	public String read(@RequestParam("num") int num, Model model) {
		WriteBean board = service.read(num);
		model.addAttribute("board", board);
		return "read";

	}
	
/*	@RequestMapping("deleteForm.do")	게시글 삭제 페이지
	public String deleteForm(@RequestParam("num") int num, Model model,HttpSession session){
//		WriteBean board = service.read(num);
//		model.addAttribute("board", board);
		String session_email = (String) session.getAttribute("email");
		MemberBean member = memberService.getMember(session_email);
		System.out.println("member:"+member);
		model.addAttribute("member", member);
		
		return "deleteForm";
	}	*/
	
/*	@RequestMapping("delete.do")	게시글 삭제 페이지
	public String delete(@RequestParam("num") int num, String email, Model model,HttpSession session){
		String session_email = (String) session.getAttribute("email");
		String grade = (String) session.getAttribute("grade");

		if (email.equals(session_email) || grade.equals("master")){
			int result = service.delete(num);
			model.addAttribute("result", result);
			return "writeDelete";
		} //운영자 권한 또는 이메일이 같을 경우 
		else {
			return "isWrongEmail//e";
		}*/
	@RequestMapping(value = "wdelete.do")
	public String wdelete(int board_num, Model model,String email,HttpSession session) {
		
		System.out.println(board_num);

		int result = service.wdelete(board_num);

		return result == 0 ? "redirect:wlist.do" : "isWrongEmail//e";
	}	
	
	@RequestMapping(value = "wupdate.do")
	public String updateQuestion(WriteBean writebean) {
		System.out.println();
		System.out.println("1");
		int result = service.wupdate(writebean);
		System.out.println("4");
		if(result >0) {
			return "error_check/msg";
		}else {
			return "error_check/updateFail";
		}
		

	}
	
	
	
	
	
	

	
/*@RequestMapping("wsend.do")
public String send(Model model) {

	Random random = new Random();
	int a = random.nextInt(100);

	// Mail Server 설정
	String charSet = "utf-8";
	String hostSMTP = "smtp.naver.com";
	String hostSMTPid = "sanctimony@naver.com";
	String hostSMTPpwd = "qwejrc47tr6w2!"; // 비밀번호 입력해야함

	// 보내는 사람 EMail, 제목, 내용
	String fromEmail = "sanctimony@naver.com";
	String fromName = "행복한 부엉이";
	String subject = "신고결과 검토중 입니다.";

	// 받는 사람 E-Mail 주소
	String mail = "happybueong@gmail.com";

	try {
		HtmlEmail email = new HtmlEmail();
		email.setDebug(true);
		email.setCharset(charSet);
		email.setSSL(true);
		email.setHostName(hostSMTP);
		email.setSmtpPort(587);

		email.setAuthentication(hostSMTPid, hostSMTPpwd);
		email.setTLS(true);
		email.addTo(mail, charSet);
		email.setFrom(fromEmail, fromName, charSet);
		email.setSubject(subject);
		email.setHtmlMsg("<p align = 'center'>Overflow에 오신것을 환영합니다.</p><br>" 
						 + "<div align='center'> 인증번호 : " + a + "</div>");
		email.send();
	} catch (Exception e) {
		System.out.println(e);
	}
	
	model.addAttribute("result", "good~!!\n 등록된 E-Mail 확인");

	return "result";
}*/

}