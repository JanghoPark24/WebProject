package thelecture.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;



//
@RestController
public class SPAcontroller {
	@Autowired
	LectureDaoImpl lecturedao;
	
//	@RequestMapping("/majorList/{major}")
//	public List<LectureBean> majorList(){
//		
//		ArrayList<LectureBean> majorList =
//				(ArrayList<LectureBean>) lecturedao.getLectureList(page_index)() ;
//		
//		return majorList;
//		
//	}
	
}
