package thelecture.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;
import thelecture.service.BoardService;



/**
 * SPA(Single Page Application) 한 페이지 내에서 해결되는 ajax를 다루는 controller
 * 
 */
@RestController
public class SPAcontroller {
	@Autowired
	BoardService boardService;
	
	
	
//	@RequestMapping("reply.do")
//	public List<ReplyBean> reply(){
//		
//		List<ReplyBean> replies = new ArrayList<>();
//		
//		return replies;
//	}
	
	@RequestMapping("selectQuetionnaire.do")
	public List<QuestionBean> selectQuestionnaire( String questionVersion){
		
		List<QuestionBean> questionnaire=boardService.getQuestionnaire(questionVersion);
		System.out.println("questionVersion"+questionnaire);
		
		return questionnaire;
	}
	
	
}
