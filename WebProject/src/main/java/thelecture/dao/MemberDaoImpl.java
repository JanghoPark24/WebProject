package thelecture.dao;

import java.util.HashMap;
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
	public boolean isDuplication(String column, String value) throws Exception {
		boolean authcode = false; // 중복이 아니면 0
		MemberBean mb = (MemberBean) sqlSession.selectOne("isdup_" + column, value);
		if (mb != null)
			authcode = true;
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
	 * 회원인증
	 */
	@Transactional
	public String getEmail(String reg_key) throws Exception {
		return sqlSession.selectOne("getEmail", reg_key);
	}

	/**
	 * 회원선택
	 * 
	 * @param email
	 * @return MemberBean
	 */
	@Transactional
	public MemberBean select_member(String email) throws Exception {
		return sqlSession.selectOne("select_member", email.toLowerCase());
	}

	/**
	 * 등급 설정
	 */
	@Transactional
	public void setGrade_to(String grade, String email) {
		sqlSession.update("setGrade_to_" + grade, email);
	}
	
	/*
	 * 회원정보수정!
	 */

	@Transactional
	public boolean member_update(MemberBean mb) throws Exception {
		
		int updatedRowCount =sqlSession.update("memberns.member_update", mb);
		
		return (updatedRowCount==1)? true:false;
	}

	@Transactional
	public void member_reset_password(MemberBean mb) {
		sqlSession.update("member_reset_password", mb);
	}

	/*
	 * 전체회원목록
	 */

	@Transactional
	public List<MemberBean> memberList() {
		return sqlSession.selectList("memberList");
	}

	// 회원 정보 상세 조회
	@Transactional
	public MemberBean getMember(String email) {
		System.out.println("dao");
		return sqlSession.selectOne("getMember",email);
	}

	/*
	 * 회원상세정보
	 */

	@Transactional
	public MemberBean viewMember(String nickname) {
		System.out.println("dao");
		return sqlSession.selectOne("viewMember", nickname);
	}

	
	
	public boolean insertProfile(MemberBean mb) {
		
		int insertedRowCount = sqlSession.insert("insertImage",mb);
		System.out.println(insertedRowCount);
		return (insertedRowCount==1)?true:false;
	}
	
	public boolean member_update_profile(MemberBean mb) {
		
		int affectedRow = sqlSession.update("memberns.member_update_profile_img", mb);
		
		return (affectedRow==1)? true:false; 
	}

	public MemberBean getMemberByEmail(String email) {
		MemberBean memberInfo = sqlSession.selectOne("getMemberByEmail", email);
		if (memberInfo.getProfile_img()==null) {
			memberInfo = sqlSession.selectOne("getMemberByEmail_noImage", email);
		}
		return memberInfo;
	}

	public boolean checkByGetProfileImgByemail(String email) {
		try {
			MemberBean mb = (MemberBean)sqlSession.selectOne("getProfileImgByEmail",email);
			
			return (mb.equals(null))? false:true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	public String getProfileURL(MemberBean mb) {
//		
//		return sqlSession.selectOne("selectProfileURL",mb);
//	}

}
