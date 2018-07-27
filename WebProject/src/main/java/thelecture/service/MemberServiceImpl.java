package thelecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.MemberDaoImpl;
import thelecture.model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDaoImpl memberDao;

	//전체 회원 목록 조희
    public List<MemberBean> memberList() {
    	return memberDao.memberList();
    }
	
	//회원 정보 상세 조회
    public MemberBean viewMember(String nickname) {
    	System.out.println("Service");
    	return memberDao.viewMember(nickname);
    }
    
	
	public int is_dup_email(String email) throws Exception {
		//비교를 위해서 대문자로 만든다.
		int result = memberDao.isDup_email(email.toUpperCase());
		return result;

	}
	public int is_dup_nickname( String nickname) throws Exception {
		//비교를 위해서 대문자로 만든다.
		int result = memberDao.isDup_nickname(nickname.toUpperCase());
		return result;
		
	}

	public void member_join(MemberBean mb) throws Exception {
		memberDao.member_join(mb);
	}

	/*public void member_update(MemberBean mb) throws Exception {
		memberDao.member_update(mb);
	}
*/	
		
}
