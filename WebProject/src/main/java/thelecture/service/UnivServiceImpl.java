package thelecture.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.UnivDaoImpl;

@Service
@Transactional
public class UnivServiceImpl {
	@Autowired
	private UnivDaoImpl univDao;

	/**
	 * 대학리스트
	 * 
	 * @return
	 */
	public List<String> getUniv_list() {
		return univDao.getUniv_list();
	}

}
