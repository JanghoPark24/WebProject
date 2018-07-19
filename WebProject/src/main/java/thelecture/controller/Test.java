package thelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Test {
	
	@RequestMapping("test.do")
	public String test() {		
	
		System.out.println("test");
		/* 테스팅하기 위한 jsp의 경로 및 파일명을 입력하고 
		 * test.jsp를 더블클릭해서 테스트한다.
		 * 
		 *예시)
		 *return "content/university/write_view"; 
		 *
		 *브라우저 상에서
		 *http://localhost/WebProject/test.do
		 *를 입력하여 이동하여 테스트한다.
		 **/
		return "content/university/board";
	}
	
}
