 package thelecture.controller.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import thelecture.controller.LecturesController;

@RunWith(SpringJUnit4ClassRunner.class)
@EnableWebMvc
@ContextConfiguration(locations = 
	{"classpath*:spring/root-context.xml"})
public class LecturesControllerTest {
		
	private MockMvc mockMvc;
	
//	@Mock
	@Autowired
    private FilterChainProxy springSecurityFilterChain;

    @Autowired
    private WebApplicationContext wac;

    protected MockHttpSession session;

    protected MockHttpServletRequest request;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).addFilters(this.springSecurityFilterChain).build();
    }	
	
	private LecturesController lecturesController = new LecturesController();

//	@Mock
//	private Model model;
//	
	@Test
    void test(){
    // I log in and then returns session 
//	    HttpSession session = mockMvc.perform(post("/j_spring_security_check").param("email", ).param("PASSWORD", pass))
//	                .andDo(print()).andExpect(status().isMovedTemporarily()).andReturn().getRequest().getSession();
    }

	@Test
	public void testAnswerQuestion() {
		
	}

}
