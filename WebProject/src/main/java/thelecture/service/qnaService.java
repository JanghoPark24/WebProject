package thelecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thelecture.dao.qnaDaoImpl;
import thelecture.model.qnaBean;

@Service
public class qnaService {

	@Autowired
	private qnaDaoImpl dao;
	
	public int insert(qnaBean qna) {
		System.out.println("b");
		return dao.insert(qna);
		
	}
}
