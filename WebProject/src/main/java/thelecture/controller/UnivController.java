package thelecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import thelecture.model.UnivBean;
import thelecture.service.UnivServiceImpl;

@Controller
public class UnivController {

	@Autowired
	private UnivServiceImpl UnivService;


	/**
	 * 회원 가입하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("univ_list.do")
	public String univ_list(@RequestParam("category") String category, Model model) {
		
		List<UnivBean> data_univ_list= UnivService.univ_list();
		
		
		model.addAttribute("result", data_univ_list);
		return "content/university/data_univ_list";
	}
	@RequestMapping("insertNewUniv.do")
	public String insert_new_univ(UnivBean univ) {
		
		
		return "content/university/data_univ_list";
	}
	
	


}