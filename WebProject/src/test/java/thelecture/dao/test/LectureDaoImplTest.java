package thelecture.dao.test;

import static org.junit.Assert.*;


import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import thelecture.dao.LectureDaoImpl;
import thelecture.model.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})


public class LectureDaoImplTest {

	@Inject
	LectureDaoImpl lectureDao;
	
	

//	@Test
//	public final void testGetRowCount() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public final void testGetAllLectureList() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public final void testGetLectureList() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testGetLectureListById() {
		PageBean page_index = new PageBean();
		page_index.setStartRow(1);
		page_index.setEndRow(1);
		assertEquals(1, lectureDao.getLectureList(page_index));
	}

}
