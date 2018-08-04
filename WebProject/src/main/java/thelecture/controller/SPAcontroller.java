package thelecture.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.ReplyBean;



/**
 * SPA ajax를 다루는 controller
 * 
 */
@RestController
public class SPAcontroller {
	@Autowired
	LectureDaoImpl lecturedao;
	
//	@RequestMapping("reply.do")
//	public List<ReplyBean> reply(){
//		
//		List<ReplyBean> replies = new ArrayList<>();
//		
//		return replies;
//	}
	
	
}
