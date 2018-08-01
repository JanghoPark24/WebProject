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
	 * 중복체크를 하는 메소드입니다.
	 * 
	 * @param column
	 * @param value
	 * @return DB에 해당column에 해당value가 있으면 1을 리턴한다. 그렇지 않으면 0을 리턴한다
	 */
	@Transactional
	public int isDuplication(String column, String value) throws Exception {
		System.out.println("memberDAO");
		int authcode = 0; // 중복이 아니면 0
		MemberBean mb = (MemberBean) sqlSession.selectOne("isdup_" + column, value);
		if (mb != null)
			authcode = 1;
		return authcode;
	}

	/**
	 * 회원가입
	 */
	@Transactional
	public void member_join(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}

	/**
	 * 회원선택
	 * @param email
	 * @return MemberBean
	 */
	@Transactional
	public MemberBean select_member(String email)throws Exception {
		return sqlSession.selectOne("select_member", email);
	}

	// public MemberBean getMemberInfo(String email) {
	//
	// return sqlSession.selectOne("get_member", email);
	// }

	/*
	 * 회원정보수정
	 */
	
	  @Transactional 
	  public int member_update(MemberBean mb) throws Exception {
		  System.out.println("3");
		  return sqlSession.update("memberns.member_update", mb); 
		 }
	 

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
		return sqlSession.selectOne("viewMember", nickname);
	}

}
