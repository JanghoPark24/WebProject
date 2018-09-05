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
	public final static int NOT_EXIST=0;
	public final static int ADD=1;
	public final static int DIFFERENT = 2;
	
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
		ReplyBean newLikeInfo = new ReplyBean();
		
		
		newLikeInfo.setLikes(like);
		newLikeInfo.setReply_num(reply_num);
		newLikeInfo.setEmail(email);
		
		int affectedRow=0;
		//이메일로 이미 like or dislike 있는지 대조 (
		
		//reply num에 이메일 존재하는지 구해오기
		int email_in_replyNum = replydao.getEmailByReplyNum(newLikeInfo);
		//reply num에 점수가 1또는 -1인지 구해오기
		int existingLikeType= replydao.getLikeByEmailAndReplyNum(newLikeInfo);
		
		System.out.println("existingEmailCount:"+email_in_replyNum);
		System.out.println("existingLikeByEmail:"+existingLikeType);
		
		//댓글에 생성된 현재 이메일 없음
		if(email_in_replyNum==NOT_EXIST ) {
			affectedRow = replydao.add_new_likeToReply(newLikeInfo);
			
		//댓글에 현재 이메일 생성됐고 like check는 되지 않음
		}else if(existingLikeType ==NOT_EXIST){ 
			affectedRow = replydao.updateLikeInReply(newLikeInfo,like,NOT_EXIST);
			
		//댓글에 현재 이메일 생성됐고 like check와 지금 like가 서로 다름
		}else if(existingLikeType == -like){
			affectedRow = replydao.updateLikeInReply(newLikeInfo,like,DIFFERENT);
			
		//댓글에 현재 이메일 생성됐고 like check와 지금 like가 서로 같음
		}else if(existingLikeType == like) {
			affectedRow = replydao.cancelLikeInReply(newLikeInfo,like);
			
		}
		
		//체크 안됐고 새로운 like
		
		
		
		System.out.println("affectedRow:"+affectedRow);
		return (affectedRow==1)? true:false;
	}

	public int getLikesByReplyNum(int reply_num) {
		int likes = replydao.getLikesByReplyNum(reply_num);
		
		//like가 0보다 크거나 같으면 그대로 아니면 0으로 
		return  (likes>=0)? likes: 0;
	}

}
