package thelecture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import thelecture.service.UnivServiceImpl;



/**
 * SPA(Single Page Application) 한 페이지 내에서 해결되는 ajax를 다루는 controller
 */
@RestController
public class SPAcontroller2 {
	@Autowired
	UnivServiceImpl univService;
	
	/**
	 * 대학 리스트 데이터를 json으로 전달함
	 */
	@RequestMapping("autocomplete_univ.do")
	public List<String> selectUnivList(){
		List<String> univ_list= univService.getUniv_list();
		return univ_list;
	}
	
}
