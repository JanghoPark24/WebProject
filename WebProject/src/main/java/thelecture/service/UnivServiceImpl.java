package thelecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.UnivDaoImpl;

@Service
public class UnivServiceImpl {
	@Autowired
	private UnivDaoImpl univDao;

	public String find_domain(String domain) throws Exception {
		System.out.println("US");
		return univDao.find_domain(domain);

	}

}