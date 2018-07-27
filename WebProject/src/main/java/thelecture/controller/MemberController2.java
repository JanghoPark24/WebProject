package thelecture.controller;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/*import myboard.model.Board;*/
import thelecture.model.MemberBean;
import thelecture.security.TempKey;
import thelecture.service.MemberServiceImpl;
import thelecture.service.UnivServiceImpl;


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