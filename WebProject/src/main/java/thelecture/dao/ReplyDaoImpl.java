package thelecture.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.ReplyBean;
import thelecture.service.ReplyService;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ReplyBean> getAllCommentsByLectureId(int lecture_id) {

		return sqlSession.selectList("reply.getAllCommentsByLectureId", lecture_id);
	}

	public List<ReplyBean> getReplyListById(int lecture_id) {
		try {

			return sqlSession.selectList("reply.getLectureReplyListById", lecture_id);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Transactional
	public int getReplyCountByLectureId(int lecture_id) {
		try {
			// search, keyword 전달
			return sqlSession.selectOne("reply.getReplyCountByLectureId", lecture_id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public boolean addLectureComment(ReplyBean comment) {
		int affectedRow;

		try {
			if (comment.getDepth() == 0) {

				affectedRow = sqlSession.insert("reply.addNewComment", comment);
			} else {
				System.out.println("content:" + comment.getContent());
				affectedRow = sqlSession.update("reply.updateBeforeAddReply", comment);
				affectedRow += sqlSession.update("reply.addReplyToComment", comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
			affectedRow = 0;

		}
		return (affectedRow != 0) ? true : false;
	}

	public List<ReplyBean> getRepliesOfCommentsByLectureId(int lecture_id) {

		return sqlSession.selectList("reply.getRepliesOfCommentsByLectureId", lecture_id);
	}

	public ReplyBean getLectureCommentByReplyNum(int reply_num) {

		return sqlSession.selectOne("reply.getLectureCommentByReplyNum", reply_num);
	}

	@Override
	public boolean addComment(ReplyBean reply) {
		return false;
	}

	@Override
	public List<ReplyBean> getAllCommentsByBoardId(int boardnum) {
		return null;
	}

	@Override
	public List<ReplyBean> getRepliesOfCommentsByBoardId(int boardnum) {
		return null;
	}

	@Override
	public int getReplyCountByBoardId(int boardnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getReplyNumOfLastComment(ReplyBean reply) {

		return sqlSession.selectOne("reply.getReplyNumOfLastComment", reply);
	}

	public int cancelLikeInReply(ReplyBean likeInfo, int like) {
		try {
			Integer canceledRow = 0;

			canceledRow += sqlSession.update("reply.cancelLikeInReplyCheck", likeInfo);
			canceledRow += sqlSession.update("reply.cancelLikeInReply", likeInfo);
			return (canceledRow == 2) ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getLikeByEmailAndReplyNum(ReplyBean likeInfo) {
		try {
			Integer emailRow;

			emailRow = sqlSession.selectOne("reply.checkLikeByEmailAndReplyNum", likeInfo);
			return (emailRow == null) ? 0 : emailRow;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getEmailByReplyNum(ReplyBean likeInfo) {

		try {
			int emailRow = 0;

			emailRow = sqlSession.selectOne("reply.checkEmailByReplyNum", likeInfo);
			return emailRow;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int add_new_likeToReply(ReplyBean likeInfo) {
		int affectedRow = 0;
		try {
			affectedRow += sqlSession.insert("insertLikeToReplyCheck", likeInfo);
			affectedRow += sqlSession.update("update_likeToReply", likeInfo);

			return affectedRow == 2 ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int updateLikeInReply(ReplyBean likeInfo, int like, int type) {
		int affectedRow = 0;
		try {
			affectedRow += sqlSession.insert("updateLikeReplyCheck", likeInfo);

			// 현재와 같으면 like에서 -1, 현재와 다르면
			likeInfo.setLikes(type == ReplyService.DIFFERENT ? 2 * like : like);
			affectedRow += sqlSession.update("update_likeToReply", likeInfo);
			return (affectedRow == 2) ? 1 : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getLikesByReplyNum(int reply_num) {
		try {
			Integer likes = sqlSession.selectOne("getLikesByReplyNum", reply_num);
			return (likes == null) ? 0 : likes;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public String getEmailByReplyNum(int reply_num) {
		try {

			return sqlSession.selectOne("getEmailByReplyNum", reply_num);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public boolean updateLectureComment(ReplyBean comment) {
		Integer affectedRow;

		try {

			affectedRow = sqlSession.update("reply.updateComment", comment);

		} catch (Exception e) {
			e.printStackTrace();
			affectedRow = null;

		}
		return (affectedRow == null) ? false : true;
	}

	public int delete_comment(ReplyBean comment) {
		Integer affectedRow;
		try {

			affectedRow = sqlSession.update("reply.deleteComment", comment);

		} catch (Exception e) {
			e.printStackTrace();
			affectedRow = null;

		}
		return (affectedRow == null) ? 0 : affectedRow;
	}

}
