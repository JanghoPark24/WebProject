package thelecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.MemberDaoImpl;
import thelecture.model.MemberBean;

@Service
@Transactional
public class MemberServiceImpl {
	@Autowired
	private MemberDaoImpl memberDao;

	// 전체 회원 목록 조희
	public List<MemberBean> memberList() {
		return memberDao.memberList();
	}

	// 회원 정보 상세 조회
	public MemberBean viewMember(String nickname) {
		System.out.println("Service");
		return memberDao.viewMember(nickname);
	}

	/**
	 * 중복체크를 하는 메소드입니다.
	 * 
	 * @param column
	 * @param value
	 * @return DB에 해당column에 해당value가 있으면 1을 리턴한다. 그렇지 않으면 0을 리턴한다
	 */
	public int isDuplication(String column, String value) throws Exception {
		int result = memberDao.isDuplication(column, value.toLowerCase());
		return result;
	}

	/**
	 * 중복체크를 하는 메소드입니다.
	 * 
	 * @param column
	 * @param value
	 * @param caseSensitive가
	 *            true면 대소문자를 구분한다.
	 * @return DB에 해당column에 해당value가 있으면 1을 리턴한다. 그렇지 않으면 0을 리턴한다
	 */
	public int isDuplication(String column, String value, boolean caseSensitive) throws Exception {
		int result = memberDao.isDuplication(column, (caseSensitive) ? value : value.toLowerCase());
		return result;
	}

	public void member_join(MemberBean mb) throws Exception {
		memberDao.member_join(mb);
	}
	public MemberBean select_member(String email) throws Exception {
		return memberDao.select_member(email.toLowerCase());
	}
	/*
	 * public void member_update(MemberBean mb) throws Exception {
	 * memberDao.member_update(mb); }
	 */

}
