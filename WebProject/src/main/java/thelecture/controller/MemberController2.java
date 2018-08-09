package thelecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping("read.do")
	public String read(@RequestParam("num") int num, Model model) {
		WriteBean board = service.read(num);
		model.addAttribute("board", board);
		return "read";
	
	}
}