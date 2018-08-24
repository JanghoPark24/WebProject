package thelecture.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
		UnivBean ub = (UnivBean) sqlSession.selectOne("find_domain", domain);
		return (ub!=null)?ub.getUniv_name():"";
	}
	
	@Transactional
	public List<String> getUniv_list(){
		return sqlSession.selectList("getUniv_list");
	}
	

	public int insertUniv(UnivBean university) {
		try {
			System.out.println(
					university.getUniv_name());
			sqlSession.insert("univns.insertUniv",university);
			return 0;
			
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}
	}


}
