 package thelecture.controller.test;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.stubbing.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.ui.Model;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import thelecture.controller.LecturesController;
import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.MemberBean;
import thelecture.model.QuestionBean;
import thelecture.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@EnableWebMvc
@ContextConfiguration(locations = 
	{"classpath*:spring/root-context.xml"})
public class LecturesControllerTest {
		
	
	@Inject
	private LecturesController lecturesController;
	
	@Mock
	HttpSession session;
	@Mock
	HttpServletRequest request;
	
	@Mock
	Model model;
	
	@Mock
	private MemberBean member;
	

	@Test
	public void testInsert_question() {
		QuestionBean questionBean = new QuestionBean();
		questionBean.setQuestion_version("good");
		
//		lecturesController.insert_question(questionBean);
	 
//		lecturesController.review(6,session,request,member);
		
		System.out.println("questionVersion:"+questionBean.getQuestion_version());
		
	}

}
