package thelecture.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.MemberBean;

@Repository
public class MemberDaoImpl {
	@Autowired
	private SqlSession sqlSession;
	/**
	 * 중복 체크
	 */
	public int member_dup_check(String email) throws Exception {
		MemberBean mb = (MemberBean) sqlSession.selectOne("dup_check", email);
		int authcode = -1;	// 사용 가능한 ID
		if (mb != null)
			authcode = 1; 	// 중복id
		return authcode;
	
	}
	/**
	 * 회원가입
	 */
	public void join_member(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}

}