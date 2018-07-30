package thelecture.service;
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

	public WriteBean read(int num){
	
		return dao.read(num);
	}

	
	
}
