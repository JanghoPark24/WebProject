package thelecture.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.WriteBean;
 

@Repository
public class WriteDaoImpl{
	
	@Autowired
	private SqlSession session;

	public int insert(WriteBean writeBean) {
		return session.insert("insert", writeBean);		
	}

/*	public WriteBean read(int num){
	return session.selectOne("read", num);
	}
*/
		

}

