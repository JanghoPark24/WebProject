package thelecture.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.MemberBean;
import thelecture.model.UnivBean;

@Repository
public class UnivDaoImpl {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * 도메인 불러오기
	 */
	@Transactional
	public String find_domain(String domain) throws Exception {
		System.out.println("UD");
		UnivBean ub = (UnivBean) sqlSession.selectOne("find_domain", domain);
		
		return (ub!=null)?ub.getUniv_name():"";
	}

}
