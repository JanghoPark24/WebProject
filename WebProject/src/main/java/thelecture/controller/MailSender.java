package thelecture.controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailSender {
	@RequestMapping("/resetReq.do")
	public String gmailSending(String userEmail) {
         
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            
            from = new InternetAddress("TheLecture<TheLecture.corp@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(userEmail.trim());
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("비밀번호 재설정", "UTF-8");
            // 이메일 내용 
            msg.setText("<div class='container' style='padding: 20px;"  
            		+"background: #eeeeee;"  
            		+"border: 1px solid #999999;'>"  
            		+"<div class='jumbotron' style='margin: 20px;font-size:14px;background: #eeeeee;'>"  
            		+"<h3>비밀번호 재설정</h3> "  
            		+"안녕하세요. 회원님<br>"  
            		+"본 링크를 클릭하여 비밀번호 재설정을 하시길 바랍니다.<br>"  
            		+"본인이 요청한 메일이 아닌 경우, 개인정보 보호를 위해 비밀번호를 다시 설정하시길 바랍니다.<br>"
            		+"해당 링크는 XX년 X월 X일까지 유효합니다.<br><br>"  
            		+"<a href='https://www.google.com'"
            		+"target='_blank' "
            		+"style='color:white;text-decoration:none;font-size:14px;border-radius:3px;background-color:#337ab7;padding:8px 12px;border:none'" 
            		+"data-saferedirecturl='https://www.google.com'"
            		+">비밀번호 재설정</a><br><br>" + 
            		"<p style='font-size:12px;color:#444444'>버튼이 동작하지 않으면 아래의 링크를 웹브라우저에 붙여넣으십시오.</p>" 
            		);
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg);
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
		return "loginForm";
    }
 
}
 
 
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pa;
 
    public MyAuthentication(){
         
        String id = "TheLecture.corp@gmail.com";       // 구글 ID
        String pw = "ejfprcu2018";          // 구글 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
      
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}