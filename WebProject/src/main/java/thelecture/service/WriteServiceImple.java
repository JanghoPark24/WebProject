package thelecture.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.WriteDaoImpl;
import thelecture.model.WriteBean;

@Service
public class WriteServiceImple {
	@Autowired
	private WriteDaoImpl dao;

	public int insert(WriteBean writeBean) {
		return dao.insert(writeBean);
	}

	public int count() {
		return dao.count();
	}

	public List<WriteBean> list() {
		return dao.list();
	}

	public WriteBean read(int num) {
		return dao.read(num);
	}

	public int delete(int num) {
		return dao.delete(num);
	}


	
	
	
/*	public WriteBean read(int num){
	
		return dao.read(num);
	}
*/
	
	
}
