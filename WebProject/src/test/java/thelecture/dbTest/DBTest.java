package thelecture.dbTest;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DBTest {
	
	@Inject
	private DataSource dataSource;
	
	@Test
	public void testConnection() throws Exception{
		try {
			Connection connection = dataSource.getConnection();
			System.out.println(connection);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	 //로깅을 위한 변수 선언
    private static final Logger logger=
            LoggerFactory.getLogger(DBTest.class);
    private static final String DRIVER
    ="oracle.jdbc.driver.OracleDriver";
    //연결문자열 jdbc:oracle:thin:@호스트:포트:sid
    private static final String URL
    ="jdbc:oracle:thin:@localhost:1521/orcl";
    private static final String USER="spring";//아이디
    private static final String PW="1111";//
    
	
    @Test//Junit이 테스트하는 메소드
    public void test() throws ClassNotFoundException {
        Class.forName(DRIVER);//jdbc 드라이버 로딩
        
        //괄호안에 리소스 자동 삭제 
        try(Connection conn=DriverManager.getConnection(URL, USER, PW)){
            logger.info("오라클에 연결되었습니다");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}
