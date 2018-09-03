package thelecture.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import thelecture.dao.LectureDaoImpl;
import thelecture.dao.RatingDaoImpl;
import thelecture.dao.ReplyDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.Lecture_ratingBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;

/**
 * 충돌방지를 위해서 임시로 만든 class <br>
 * 추후에 메소드만 옮기고 지워야 함
 * 
 * 
 * @author SpectralFox
 *
 */
@Service
@Transactional
public class EtcService {

	@Autowired
	public LectureDaoImpl lecturedao;
	@Autowired
	public RatingDaoImpl ratingdao;
	@Autowired
	public ReplyDaoImpl replydao;

	@Transactional
	public LectureBean getReviewDetail(int lecture_id, Model model) {
		
		
		LectureBean lb = lecturedao.getLectureById(lecture_id);
		List<QuestionBean> qb_list = ratingdao.getQBList(lecture_id);
//		List<Lecture_ratingBean> rb_list = ratingdao.getRBList(lecture_id);
		
		//댓글 속성
		int countOfComment = replydao.getReplyCountByLectureId(lecture_id);
		if(countOfComment!=0) {
			List<ReplyBean> comment_list = replydao.getAllCommentsByLectureId(lecture_id); 
			List<ReplyBean> re_reply_list = replydao.getRepliesOfCommentsByLectureId(lecture_id);
			model.addAttribute("comment_list", comment_list);// List<QuestionBean>
			model.addAttribute("re_reply_list",re_reply_list);
			
		}
//		model.addAttribute("rb_list", rb_list);// List<Lecture_ratingBean>
		model.addAttribute("qb_list", qb_list);// List<QuestionBean>
		model.addAttribute("countOfComment",countOfComment);
		
		
		return lb;
	}
	
	@Transactional
	public LectureBean getReviewDetail_t(int lecture_id, HttpSession session, Model model) {
		
		
		LectureBean lb = lecturedao.getLectureById(lecture_id);
		
		//rating 항목, 점수 등 가져오기
		List<Lecture_ratingBean> rb_list = 
				ratingdao.getRBList(lecture_id, 
						  lecturedao.getQuestionVersionById(lecture_id));
		
		Double avg_score = lecturedao.getAvgScoreById(lecture_id);
		//user
		int ratedUsers= lecturedao.getRatedUsersById(lecture_id);
		
		//댓글 속성 
		int countOfComment = replydao.getReplyCountByLectureId(lecture_id);
		if(countOfComment!=0) {
			List<ReplyBean> comment_list = replydao.getAllCommentsByLectureId(lecture_id); 
			List<ReplyBean> re_reply_list = replydao.getRepliesOfCommentsByLectureId(lecture_id);
			model.addAttribute("comment_list", comment_list);// List<QuestionBean>
			model.addAttribute("re_reply_list",re_reply_list);
			
		}
		
		//로그인 된 이메일에 대해 answer 했는지 여부 찾기
		String email= session.getAttribute("email")+"";
		if(!email.equals(null)) {
			
			boolean isAlreadyAnswered = ratingdao.checkIsAlreadyAnsweredByThisEmail(lecture_id, session.getAttribute("email")+"", lb.getQuestion_version());
			//응답 됐으면
			if(isAlreadyAnswered==true) {
				
				model.addAttribute("isAlreadyAnswered", isAlreadyAnswered);// List<QuestionBean>
			}
		}
		
		
		model.addAttribute("rb_list", rb_list);// List<Lecture_ratingBean>
		model.addAttribute("countOfComment",countOfComment);
		model.addAttribute("total_avg_score",avg_score);
		model.addAttribute("rating_count",ratedUsers);
		
		
		return lb;
	}

	@Transactional
	public List<Lecture_ratingBean> getRBList(int lecture_id, String question_version) {
		//List<Lecture_ratingBean> result = ratingdao.getRBList(lecture_id);
		List<Lecture_ratingBean> result = ratingdao.getRBList(lecture_id, question_version);
		
		return result;
	}

	@Transactional
	public List<QuestionBean> getQBList(int lecture_id) {
		List<QuestionBean> result = ratingdao.getQBList(lecture_id);
		return result;
	}
	
	@Transactional
	public List<String> getLec_list(){
		return lecturedao.getLec_list();

	}
	
}
