package thelecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.UnivDaoImpl;

@Service
public class UnivServiceImpl {
	@Autowired
	private UnivDaoImpl univDao;
	
	public String find_domain(String domain) throws Exception {
		return univDao.find_domain(domain);

	}

}
