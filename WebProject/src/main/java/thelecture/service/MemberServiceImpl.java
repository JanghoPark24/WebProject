package thelecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.MemberDaoImpl;
import thelecture.model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDaoImpl memberDao;

	public int member_dup_check(String email) throws Exception {
		return memberDao.member_dup_check(email);
	}

	public void join_member(MemberBean id) throws Exception {
		memberDao.join_member(id);
	}

}