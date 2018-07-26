 package thelecture.controller.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import thelecture.controller.LecturesController;

@RunWith(SpringJUnit4ClassRunner.class)
@EnableWebMvc
public class LecturesControllerTest {
		
	@Autowired
	private MockMvc mvc;
	
	@Mock
	LecturesController lecturesController;
	
	
	@Test
	public void testHome() {
		fail("Not yet implemented");
	}

	@Test
	public void testReview() {
//		final String lectureCode = "A870s";
//		mvc.perform(get(LecturesController.URL, lectureCode));
		
	}

}
