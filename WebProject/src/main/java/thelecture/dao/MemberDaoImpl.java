package thelecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.MemberBean;

@Repository
public class MemberDaoImpl {
	@Autowired
	private SqlSession sqlSession;
	/**
	 * email 중복 체크
	 */
	@Transactional
	public int isDup_email(String email) throws Exception {
		int authcode = 0;	//중복이 아니면 0		
		MemberBean mb = (MemberBean) sqlSession.selectOne("isdup_email", email);
		if (mb != null)
			authcode = 1; 	
		return authcode;
	}
	/**
	 * nickname 중복 체크
	 */
	@Transactional
	public int isDup_nickname(String nickname) throws Exception {
		int authcode = 0;	//중복이 아니면 0		
		MemberBean mb = (MemberBean) sqlSession.selectOne("isdup_nickname", nickname);
		if (mb != null)
			authcode = 2; 	
		return authcode;
	}
	/**
	 * 회원가입
	 */
	@Transactional
	public void member_join(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}

	/*
	 * 회원정보수정
	*/
	/*@Transactional
	public void member_update(MemberBean m) throws Exception {
	    sqlSession.update("member_update", m);	
	}*/

	/*
	 * 전체회원목록
	*/
	
	@Transactional
	public List<MemberBean> memberList() {
 return sqlSession.selectList("memberList");	
	}
	
	/*
	 * 회원상세정보
	*/
	
	@Transactional
	public MemberBean viewMember(String nickname) {
		System.out.println("dao");
		return sqlSession.selectOne("viewMember",nickname);
	}
	
}
