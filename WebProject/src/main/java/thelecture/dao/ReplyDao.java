package thelecture.dao;

import java.util.List;

import thelecture.model.ReplyBean;

public interface ReplyDao {
	public boolean addComment(ReplyBean reply);
	public List<ReplyBean> getAllCommentsByBoardId(int boardnum);
	public List<ReplyBean> getRepliesOfCommentsByBoardId(int boardnum);
	public int getReplyCountByBoardId(int boardnum);
	public int getReplyNumOfLastComment(ReplyBean reply);

}
