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
	public int is_dup_email(String email) throws Exception {
		int authcode = -1;	// 사용 가능한 ID
		MemberBean mb = (MemberBean) sqlSession.selectOne("is_dup_email", email);
		if (mb != null)
			authcode = 1; 	// 중복id
		return authcode;
	
	}
	/**
	 * 중복 체크
	 */
	public int is_dup_nickname(String nickname) throws Exception {
		int authcode = -1;	// 사용 가능한 ID
		MemberBean mb = (MemberBean) sqlSession.selectOne("is_dup_nickname", nickname);
		if (mb != null)
			authcode = 1; 	// 중복id
		return authcode;
		
	}
	/**
	 * 회원가입
	 */
	public void member_join(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}

}
