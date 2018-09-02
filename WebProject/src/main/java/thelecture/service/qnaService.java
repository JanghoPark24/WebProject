package thelecture.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    
	
	public Map<String, Object> list(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<qnaBean> list = new ArrayList<qnaBean>();
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = dao.count();
		
		list = dao.list(page);
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
		// 처리.
// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
        int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
        int endpage = maxpage;

        if (endpage > startpage + 10 - 1)
        endpage = startpage + 10 - 1;

        Map<String, Object> resultMap = new HashMap<String, Object>();

    resultMap.put("page", page);
    resultMap.put("startpage", startpage);
    resultMap.put("endpage", endpage);
    resultMap.put("maxpage", maxpage);
    resultMap.put("listcount", listcount);
    resultMap.put("list", list);

    return resultMap;
}	
	
	

	public qnaBean qna_read(int qna_num) {
		return dao.qna_read(qna_num);
	}
	
	public int qna_delete(String qna_delete) {
		return dao.qna_delete(qna_delete);
	}
}



