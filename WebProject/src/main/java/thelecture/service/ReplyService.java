package thelecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;

import thelecture.dao.ReplyDaoImpl;
import thelecture.model.ReplyBean;

@Service
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ReplyService {
	@Autowired
	ReplyDaoImpl replydao;

	public ReplyBean addAndGetLectureComment(ReplyBean comment_info) {
		boolean commentSuccess = replydao.addLectureComment(comment_info);
		if (commentSuccess == true) {
			// 마지막 Reply Num을 가져옴
			int lastReplyNum = replydao.getReplyNumOfLastComment(comment_info);

			comment_info = replydao.getLectureCommentByReplyNum(lastReplyNum);
		}
		return comment_info;
	}

	public List<ReplyBean> getAllCommentsByLectureId(int lecture_id) {

		return replydao.getAllCommentsByLectureId(lecture_id);
	}

}
