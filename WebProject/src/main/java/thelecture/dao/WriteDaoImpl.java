package thelecture.dao;
import java.util.List;

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


	public int count() {
		return session.selectOne("count");
	}

	public List<WriteBean> list() {
		return session.selectList("list");
	}

	public WriteBean read(int num){
		return session.selectOne("read", num);
	}


/*	public int delete(int num) {
		return session.delete("delete", num);
	}
*/

	public int wdelete(int board_num) {
		try {
			session.update("wdelete",board_num);
			return 0;
			
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}
	}


	public int wupdate(WriteBean writebean) {
		System.out.println("3");
		return session.update("writens.wupdate", writebean);
	}



}

