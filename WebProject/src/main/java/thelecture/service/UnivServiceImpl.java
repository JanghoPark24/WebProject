package thelecture.service;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import thelecture.dao.UnivDaoImpl;
import thelecture.model.UnivBean;
import thelecture.util.S3Util;
import thelecture.util.UploadFileUtils;

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
	
	@Transactional
	public int insertUniv(UnivBean university,MultipartFile univ_logo) {
		
		//파일 이름이 없으면 리턴
		String directory = "univImg";
		String filename =univ_logo.getOriginalFilename();
		// 아마존에 업로드
		
		try {
			String uploadedFile = UploadFileUtils.uploadFile(directory, filename, univ_logo.getBytes());
			university.setUniv_logo(uploadedFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return univDao.insertUniv(university);
	}
	
	@Transactional
	public UnivBean getUnivByName(String univ_name) {
		System.out.println(univ_name);
		return univDao.getUnivByName(univ_name);
	}
	
	@Transactional
	public int updateUniv(UnivBean university, MultipartFile univ_logo) {
		//파일 이름이 없으면 리턴
		String directory = "univImg";
		String filename =univ_logo.getOriginalFilename();
		// 아마존에 업로드
		
		try {
			String uploadedFile = UploadFileUtils.uploadFile(directory, filename, univ_logo.getBytes());
			university.setUniv_logo(uploadedFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return univDao.updateUniv(university);
	}
	
	@Transactional
	public int deleteUniv(String univ_name) {
		String directory = "univImg";
		UnivBean univ= univDao.getUnivByName(univ_name);
		UploadFileUtils.deleteFile(directory, univ.getUniv_logo());
		univDao.deleteUniv(univ_name);
		return 0;
	}

	


}
