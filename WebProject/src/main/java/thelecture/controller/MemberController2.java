package thelecture.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.MemberBean;
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
	
	@RequestMapping("delete.do")	/*게시글 삭제 페이지*/
	public String delete(@RequestParam("num") int num, String email, Model model,HttpSession session){
		String session_email = (String) session.getAttribute("email");
		String grade = (String) session.getAttribute("grade");
//		WriteBean board = service.read(num);
//		if (board.getEmail().equals(session_email) || grade.equals("master")){
		if (email.equals(session_email) || grade.equals("master")){
			int result = service.delete(num);
			model.addAttribute("result", result);
			return "writeDelete";
		} //운영자 권한 또는 이메일이 같을 경우 
		else {
			return "isWrongEmail//e";
		
		
		}
		
		
		
		
			

			
	

	
		
		
		
		
		
		
	
	}
	
}