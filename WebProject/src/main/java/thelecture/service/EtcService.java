package thelecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.LectureBean;
import thelecture.model.ReplyBean;

/**
 * 충돌방지를 위해서 임시로 만든 class <br>
 * 추후에 메소드만 옮기고 지워야 함
 * 
 * 
 * @author SpectralFox
 *
 */
@Service
@Transactional
public class EtcService {

	@Autowired
	public LectureDaoImpl lecturedao;

	@Transactional
	public LectureBean getReviewDetail(int lecture_id) {
		// 강의 정보
		LectureBean lb = lecturedao.getLectureListById(lecture_id);

		return lb;
	}

}
