 package thelecture.controller.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;

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
		
	
//	@Mock
//	private LecturesController lecturesController;
//	
//	@Mock
//	private MemberBean member;
//
//	@Mock
//	private BoardBean lecture;
//	
//	@Mock
//	private Model model;
//	
//
//	@Test
//	public void testReview() {
//		
//		//계정확인
//		
//		member.setPassword("있는 비밀번호");
//		
//		//
//		String pass = member.getPassword();
//		
//		
//		when(member.getGrade().equals("manager"))
//			.thenReturn(lecturesController.review(member, lecture, model)=="review_manager");
//			
//		
//		
//		
//	}


}
