package thelecture.service;

import java.util.List;

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
		List<Lecture_ratingBean> rb_list = ratingdao.getRBList(lecture_id);
		List<ReplyBean> comment_list = replydao.getAllCommentsByLectureId(lecture_id); 
		List<ReplyBean> re_reply_list = replydao.getRepliesOfCommentsByLectureId(lecture_id);
		int countOfComment = replydao.getReplyCountByLectureId(lecture_id);
		System.out.println(rb_list);
		model.addAttribute("rb_list", rb_list);// List<Lecture_ratingBean>
		model.addAttribute("qb_list", qb_list);// List<QuestionBean>
		model.addAttribute("comment_list", comment_list);// List<QuestionBean>
		model.addAttribute("re_reply_list",re_reply_list);
		model.addAttribute("countOfComment",countOfComment);
		return lb;
	}

	@Transactional
	public List<Lecture_ratingBean> getRBList(int lecture_id) {
		List<Lecture_ratingBean> result = ratingdao.getRBList(lecture_id);
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
