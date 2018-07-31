package thelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController2 {


	@RequestMapping("write_manager.do")
	public String write_manager() {
		return "write_manager";
	
	}
		
/*	@RequestMapping("write_managerAction.do")
	public String write_managerAction(@ModelAttribute Board board, Model model) {
	int result = bs.write_managerAction(board);
	model.addAttribute("result", result);
	return "write_managerAction";	
		*/
		
/*	}*/
		
}