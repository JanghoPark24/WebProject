package thelecture.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.simpledb.model.ReplaceableAttribute;

import thelecture.dao.LectureDaoImpl;
import thelecture.dao.MemberDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.QuestionListWrapper;
import thelecture.model.ReplyBean;
import thelecture.model.UnivBean;
import thelecture.model.MemberBean;
import thelecture.model.PageBean;
import thelecture.model.QuestionBean;
import thelecture.service.BoardService;
import thelecture.service.ReplyService;
import thelecture.util.S3Util;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LecturesController {

	@Autowired
	MemberDaoImpl memberdao;

	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;
	private static final Logger logger = LoggerFactory.getLogger(LecturesController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	public boolean isMaster(HttpSession session) {
		return (session.getAttribute("grade").equals("master"))? true:false;
	}
	
	/**
	 * 
	 * 하는 일 : 1.lectureList정보 불러오기 (1) 페이징 기능, 리스트 정보 2.detail로 들어가는 기능 3.검색기능
	 * 
	 * @param 설명
	 *            : session, view로 정보를 전하는 model, 현재 페이지, 검색어, 검색키워드
	 * @return session의 grade가 master면 lecture_master경로, 아니면 lectureList경로 리턴
	 * @author Jonghyeok
	 */
	@RequestMapping(value = "/lectureList.do")
	public String lectureList(HttpSession session, Model model, PageBean pagebean) {

	
		HashMap<String, Object> boardInfo = null;

		// get List Info -search가 있으면

		boardInfo = boardService.getLectureBoard(/*currentPage,*/ pagebean);

		// 보드 정보 다음으로 전하기
		model.addAllAttributes(boardInfo); // page_index, lectureList 전달

		return "content/lecture/lectureList";
		
	}

	



	@RequestMapping(value = "insertLectureView.do")
	public String insertLectureview(HttpSession session, Model model) {

		if (!session.getAttribute("grade").equals("master"))
			return "isNotMaster//e";

		List<String> questionVersions = boardService.getQuestionVersions();

		System.out.println("questionVersions:" + questionVersions);
		model.addAttribute("questionVersions", questionVersions);

		return "content/lecture/insert_update_lecture_view";
	}

	@RequestMapping(value = "insertLecture.do")
	public String insertLecture(LectureBean lecture) {
		boolean insertSuccess= boardService.insertLecture(lecture);
		return insertSuccess==true? "redirect:lectureList.do":"404error//e";
	}

	@RequestMapping(value = "insertQuestion.do")
	// 충돌을 막기위해 qustion type으로 question버전을 받는다.(questionList안에 question_version이 있기
	// 때문)
	public String insertQuestion(@RequestParam("question_type") String question_version,
			@RequestParam(value = "questionContents[]") String[] questionContents) {

		int result = boardService.insertQuestion(question_version, questionContents);

		// 0이 성공 1이 실패 -성공시 view화면으로
		return result == 0 ? "redirect:insertLectureView.do" : "404error//e";
	}

	@RequestMapping(value = "deleteQuestion.do")
	public String deleteQuestion(String question_version, Model model) {
		System.out.println(question_version);

		int result = boardService.deleteQuestion(question_version);

		return result == 0 ? "redirect:insertLectureView.do" : "404error//e";
	}

	@RequestMapping(value = "updateQuestions.do")
	public String updateQuestion(String[] questionIDs, String[] u_questionContents, Model model) {

		int result = boardService.updateQuestion(questionIDs, u_questionContents);

		model.addAttribute("result", result);
		return "empty/isUpdated";

	}
	
	@ResponseBody
	@RequestMapping(value = "getAllCommentsByLectureId.do")
	public List<ReplyBean> getAllCommentsByLectureId(int l_id, Model model) {

		List<ReplyBean> comments = replyService.getAllCommentsByLectureId(l_id);
		
		return comments;

	}
	@RequestMapping(value = "updateLectureView.do")
	public String updateLectureView(int lecture_id, HttpSession session,Model model) {
		if(isMaster(session)==false) {
			System.out.println(isMaster(session));
			return "isNotMaster//e";
		}else {
			LectureBean lecture= boardService.getLectureById(lecture_id);
			List<String> questionVersions = boardService.getQuestionVersions();

			model.addAttribute("questionVersions", questionVersions);
			model.addAttribute("lecture",lecture);
			model.addAttribute("state","update");
			return "content/lecture/insert_update_lecture_view";
		}
		
	} 
	
	@RequestMapping(value = "updateLecture.do")
	public String updateLecture(LectureBean lecture, HttpSession session,Model model) {
		if(isMaster(session)==false) {
			System.out.println(isMaster(session));
			return "isNotMaster//e";
		}else {
			boolean updateSuccess = boardService.updateLecture(lecture);
			
			return updateSuccess==true?"redirect:lectureList.do":"updateFail//e";
		}
		
	} 
	@RequestMapping(value = "deleteLecture.do")
	public String deleteLecture(int lecture_id, HttpSession session,Model model) {
		if(isMaster(session)==false) {
			System.out.println(isMaster(session));
			return "isNotMaster//e";
		}else {
			boolean deleteSuccess = boardService.deleteLecture(lecture_id);
			
			return deleteSuccess==true?"redirect:lectureList.do":"updateFail//e";
		}
		
	} 
	@RequestMapping(value = "answerQuestion.do")
	public String answerQuestion(int lecture_id, String univ_name ,String question_version, int []question_id, 
								@RequestParam("question_value")int [] question_value ,HttpSession session,Model model) {
		
		//현재 세션에 있는 대학과 입력된 대학 비교
		if(!session.getAttribute("univ_name").equals(univ_name)) {
			
			return "isNotRightUniv//e";
		}else {
			String email = session.getAttribute("email")+"";
			boolean answerSuccess = boardService.answerQuestion(lecture_id,question_version, email, question_id,question_value);
//			
			model.addAttribute("isAlreadyAnswered",answerSuccess);
			return answerSuccess==true?"redirect:review.do?lecture_id="+lecture_id:"updateFail//e";
			
		}
		
	} 
}
