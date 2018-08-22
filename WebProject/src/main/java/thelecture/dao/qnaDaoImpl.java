package thelecture.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.qnaBean;

@Repository
public class qnaDaoImpl {

	@Autowired
	private SqlSession session;
	
	public int insert(qnaBean qna) {
		System.out.println("c");
		return session.insert("insert",qna);
	}
	
}
