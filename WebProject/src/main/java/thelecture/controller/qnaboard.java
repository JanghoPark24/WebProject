package thelecture.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.WriteBean;
import thelecture.model.qnaBean;
import thelecture.service.qnaService;

@Controller
public class qnaboard {



	@Autowired
	private qnaService qnaService;


	/* 게시판 글쓰기 폼 */
	@RequestMapping(value = "qna_write.do")
	public String qna_write() {
		return "content/qna/qna_write";
	}

	/* 게시판 저장 */
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.POST)
	public String board_write_ok(@ModelAttribute qnaBean qna, HttpSession session,Model model)
			 {
		qna.setEmail(session.getAttribute("email").toString());
		qna.setUniv_name(session.getAttribute("univ_name").toString());
		System.out.println("a");
		qnaService.insert(qna);// 저장 메서드 호출
       
		// response.sendRedirect("board_list.nhn");
		// 게시물 목록으로 이동

		return "redirect:qna_list.do";
	}

	/* 게시판 목록 */
	@RequestMapping(value = "qna_list.do")
	public String list(HttpServletRequest request, HttpServletResponse respone ,Model model) throws Exception {
	//List<qnaBean> list = qnaService.list();
	Map<String, Object> list = qnaService.list(request,respone);		
		model.addAllAttributes(list);
    return "content/qna/qna_list";
	}

	
	@RequestMapping(value = "qna_read.do")
	public String qna_read(@RequestParam("qna_num") int qna_num,Model model) {
		qnaService.qna_upcount(qna_num);
		qnaBean qna_board = qnaService.qna_read(qna_num); 
		model.addAttribute("qboard", qna_board);
		return "content/qna/qna_read";
	}
	
	@RequestMapping(value = "qna_delete.do" )
	public String qna_delete(@RequestParam("board_num") int board_num, Model model,String email,HttpSession session) {		
		System.out.println("board_num");  
		qnaService.qna_delete(board_num);
		  
		return "redirect:qna_list.do";
	}
}