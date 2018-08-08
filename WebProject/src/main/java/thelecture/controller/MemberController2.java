package thelecture.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import thelecture.model.WriteBean;
import thelecture.service.WriteServiceImple;

@Controller
public class MemberController2 {
	@Autowired
	private WriteServiceImple service;
	
	@RequestMapping("write_manager.do")
	public String write_manager() {
		return "write_manager";
	
	}
		
	@RequestMapping("write.do")
	public String insert(@ModelAttribute WriteBean WriteBean, Model model) {
		int result = service.insert(WriteBean);
		model.addAttribute("result", result);
		return "writeAction";
	}
	
	@RequestMapping("wlist.do")
	public String list(Model model) {
		int count = service.count();
		List<WriteBean> list = service.list();
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "wlist";
	}
	
/*	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute Board DTO,HttpSession session)throws Exception{
	// session에 저장된 email를 writer에 저장
	String writer =(String)session.getAttribute("email");
	//DTO에 writer를 세팅
	DTO.setWriter(writer);
	WriteServiceImple.create(DTO);
	return"redirect:list.do";
	}
	*/
	
	
/*	@RequestMapping("read.do")
	public String read(@RequestParam("num") int num, Model model) {
		WriteBean board = service.read(num);
		model.addAttribute("board", board);

		return "read";*/
	
	/*}*/
}