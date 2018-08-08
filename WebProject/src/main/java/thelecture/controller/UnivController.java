package thelecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import thelecture.model.UnivBean;
import thelecture.service.UnivServiceImpl;

@Controller
public class UnivController {

	@Autowired
	private UnivServiceImpl univService;


	/**
	 * 회원 가입하기 위한 form이 있는 곳으로 이동
	 */
	@RequestMapping("univ_list.do")
	public String univ_list(@RequestParam("category") String category, Model model) {
		List<String> data_univ_list= univService.getUniv_list();
		model.addAttribute("result", data_univ_list);
		return "content/university/data_univ_list";
	}
	
	/**
	 * 대학 리스트 데이터를 json으로 전달함
	 */
	@RequestMapping("autocomplete_univ.do")
	@ResponseBody
	public List<String> selectUnivList(){
		List<String> univ_list= univService.getUniv_list();
		return univ_list;
	}


}