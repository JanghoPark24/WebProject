package thelecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.MemberDaoImpl;
import thelecture.model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDaoImpl memberDao;

	public int is_dup_email(String email) throws Exception {
		return memberDao.is_dup_email(email);
	}
	
	public int is_dup_nickname(String email) throws Exception {
		return memberDao.is_dup_nickname(email);
	}

	public void member_join(MemberBean mb) throws Exception {
		memberDao.member_join(mb);
	}

}
