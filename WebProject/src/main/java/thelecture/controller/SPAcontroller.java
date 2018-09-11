package thelecture.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import software.amazon.ion.SystemSymbols;
import thelecture.dao.LectureDaoImpl;
import thelecture.dao.MemberDaoImpl;
import thelecture.dao.ReplyDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;
import thelecture.service.BoardService;
import thelecture.service.ReplyService;

/**
 * SPA(Single Page Application) 한 페이지 내에서 해결되는 ajax를 다루는 controller
 * 
 */
@RestController
public class SPAcontroller {
	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;
	
	@Autowired
	ReplyDaoImpl replyDao;

	// @RequestMapping("reply.do")
	// public List<ReplyBean> reply(){
	//
	// List<ReplyBean> replies = new ArrayList<>();
	//
	// return replies;
	// }

	@RequestMapping("selectQuetionnaire.do")
	public List<QuestionBean> selectQuestionnaire(String questionVersion) {

		List<QuestionBean> questionnaire = boardService.getQuestionnaire(questionVersion);
		System.out.println("questionVersion" + questionnaire);

		return questionnaire;
	}

	@RequestMapping(value = "addandGetLectureComment.do")
	public ReplyBean addandGetLectureLectureComment(ReplyBean comment, HttpSession session) {

		String email = session.getAttribute("email") + "";
		System.out.println("email:" + email);
		if (email.equals(null)) {

			return null;
		}
		comment.setEmail(email);

		comment = replyService.addAndGetLectureComment(comment);

		return comment;
	}
	@RequestMapping(value = "updateComment.do")
	public ReplyBean updateComment(ReplyBean comment, HttpSession session) {
		
		
		String email = session.getAttribute("email") + "";
		System.out.println("email:" + email);
		if (email.equals(null)) {
			
			return null;
		}
		
		comment = replyService.updateAndGetLectureComment(comment);
		
		return comment;
	}

	//-2: 로그인 필요, -1 추천 실패
	@RequestMapping(value = "thumbsUpAndDown.do")
	public int thumbsUpAndDown(String thumbs, int reply_num, HttpSession session, Model model) throws Exception {
		System.out.println("thumbs:" + thumbs);
		int like = (thumbs.equals("up")) ? 1 : -1;
		System.out.println();
		System.out.println(replyDao.getEmailByReplyNum(reply_num));
		String email = session.getAttribute("email") + "";
		if (email.equals("null")) {
			return -2;
		}else if(email.equals(replyDao.getEmailByReplyNum(reply_num))) {
			return -3;
		} else {

			boolean likeSuccess = replyService.likeOrDislikeReply(like, reply_num, email);
			System.out.println("likeSuccess?"+likeSuccess);
			int likes = (likeSuccess == true) ? replyService.getLikesByReplyNum(reply_num) : -1;
			
			return likes;
		}
	}
	//-3 올바르지 않은 이메일, 0: 삭제 실패, 1 삭제 성공
	@RequestMapping(value = "delete_comment.do")
	public int delete_comment(ReplyBean reply, HttpSession session, Model model) throws Exception {
		if(!reply.getNickname().equals(session.getAttribute("nickname"))) {
			
			return -3; 
			
		}else {
			int result = replyDao.delete_comment(reply);
			return result; 
		}
	}

}
