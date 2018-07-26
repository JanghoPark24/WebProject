 package thelecture.controller.test;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import thelecture.controller.LecturesController;
import thelecture.model.MemberBean;

@RunWith(SpringJUnit4ClassRunner.class)
@EnableWebMvc
public class LecturesControllerTest {
		
	@Autowired
	private MockMvc mvc;
	
	@Mock
	LecturesController lecturesController;
	
	@Mock
	MemberBean member;
	
	@Test
	public void testHome() {
		fail("Not yet implemented");
	}

	@Test
	public void testReview() {
		
		when(member.getGrade())
			.thenReturn("manager")
			.thenReturn("review_manager");
		
		when(member.getGrade())
			.thenReturn("not manager")
			.thenReturn("review");
		
		
	}

}
