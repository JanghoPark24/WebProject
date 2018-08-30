package thelecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.ReplyBean;

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
		
		return sqlSession.selectList("reply.getRepliesOfCommentsByLectureId",lecture_id);
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
		// TODO Auto-generated method stub
		return 0;
	}

}
