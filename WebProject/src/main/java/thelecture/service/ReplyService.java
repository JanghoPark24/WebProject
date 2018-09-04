package thelecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.ReplyDaoImpl;
import thelecture.model.ReplyBean;

@Service
@Transactional
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

	

	public boolean likeOrDislikeReply(int like, int reply_num,String email) {
		
		//추가될 like 정보
		ReplyBean likeInfo = new ReplyBean();
		likeInfo.setLikes(like);
		likeInfo.setReply_num(reply_num);
		
		int affectedRow=0;
		//이메일로 이미 like or dislike 있는지 대조 (
		
		//reply num에 이메일 존재하는지 구해오기
		int existingEmailByReplyNum = replydao.getEmailByReplyNum(likeInfo);
		//reply num에 점수가 1또는 -1인지 구해오기
		int existingLikeRowByReplyNum = replydao.getLikeByEmailAndReplyNum(likeInfo);
		
		
		
		//적용 한게 없으면 적용 
		if(existingEmailByReplyNum==0) {
			affectedRow = replydao.add_new_likeToReply(likeInfo);
		}else if(existingLikeRowByReplyNum==0) {
			affectedRow = replydao.updateLikeInReply(likeInfo);
			
		}
		else {
		//적용 한게 있으면 취소
			affectedRow = replydao.cancelLikeInReply(likeInfo);
		}
		return (affectedRow==1)? true:false;
	}

	public int getLikeByReplyNumAndEmail(int reply_num, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

}
