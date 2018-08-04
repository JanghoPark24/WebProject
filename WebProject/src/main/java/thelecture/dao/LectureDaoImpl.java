package thelecture.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import thelecture.model.LectureBean;
import thelecture.model.PageBean;
import thelecture.model.ReplyBean;

@Repository
public class LectureDaoImpl {
	//lecturedao xml파일과 연결
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public int getRowCount() {
		try {
			return sqlSession.selectOne("lectureMap.getRowCount");
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	@Transactional
	public int getSearchRowCount(String keyword, String search) {
		try {
			Map<String, String> keyword_search = new HashMap<>();
			keyword_search.put("keyword",keyword);
			keyword_search.put("search",search);
			
			return sqlSession.selectOne("lectureMap.getSearchRowCount",keyword_search);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@Transactional
	public List<LectureBean> getAllLectureList() {
		try {
			return sqlSession.selectList("lectureMap.getAllLectures");
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	@Transactional
//	public List<LectureBean> getLectureList(HashMap<String, Integer> page_index) {
	public List<LectureBean> getLectureList(PageBean page_index) {
		try {
			return sqlSession.selectList("lectureMap.getLectureList",page_index);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public LectureBean getLectureListById(int lecture_id) {
		try {
			
			return sqlSession.selectOne("lectureMap.getLectureListById",lecture_id);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public List<ReplyBean> getReplyListById(int lecture_id) {
		try {
			
			return sqlSession.selectList("lectureMap.getLectureReplyListById",lecture_id);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
}
