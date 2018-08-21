package thelecture.controller;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {

	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}

	public void send() {
		mailSender.send(message);
	}

	/**
	 * 가입인증용 메일
	 * 
	 * @param nickname
	 * @param reg_key
	 * @param host IP Address
	 */
	public void setText_joinAuthMail(String nickname, String reg_key, String hostAddress) {
		try {
			setText(new StringBuffer().append(
					"<div class='container' style='padding: 20px;background: #eeeeee;font-size:16px;border: 1px solid #999999;'>")//
					.append("<div class='jumbotron' style='margin: 20px;background: #eeeeee;'>")//
					.append("<h2>회원가입 메일 인증</h2>" + "<span style='font-size: 18px; font-weight: 500;'>안녕하세요.  ")//
					.append(nickname)// 닉네임
					.append(" 님,</span><br><br>TheLecture 가입을 환영합니다.<br>시작하기 전에, 본인 확인을 위해 이메일 인증이 필요합니다.<br>")//
					.append("아래의 이메일 인증 주소를 클릭해주세요:<br><br><a class='btn' href='")//
					.append("http://localhost/WebProject/email_confirm.do?key=")// 가입 인증 url주소
					.append(reg_key)// 인증키값
					.append("' style='color:white;text-decoration:none;font-size:14px;border-radius:3px;background-color:#337ab7;padding:8px 12px;border:none'>이메일 인증</a>")//
					.append("<br><p style='font-size:12px;color:#444444'><br><a href='http://").append(hostAddress)//
					.append("/WebProject/home.do'style='text-decoration: none; color: #333;'target='_blank';>TheLecture</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/tos.do'style='text-decoration: none; color: #333;'target='_blank';>이용약관</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/privacy.do'style='text-decoration: none; color: #333;'target='_blank';>개인정보 처리방침</a> / <br></p></div></div>")
					.toString());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
	}
	/**
	 * 가입인증용 메일
	 * 
	 * @param nickname
	 * @param reg_key
	 * @param host IP Address
	 */
	public void setText_resetPawdMail(String nickname, String reg_key, String hostAddress) {
		try {
			setText(new StringBuffer().append(
					"<div class='container' style='padding: 20px;background: #eeeeee;font-size:16px;border: 1px solid #999999;'>")//
					.append("<div class='jumbotron' style='margin: 20px;background: #eeeeee;'>")//
					.append("<h2>비밀번호 재설정</h2>" + "<span style='font-size: 18px; font-weight: 500;'>안녕하세요.  ")//
					.append(nickname)// 닉네임
					.append(" 님,</span><br><br>비밀번호 재설정을 하기 위해서 아래의 주소를 클릭해주세요<br>")//
					.append("본인이 요청한 메일이 아닌 경우, 개인정보 보호를 위해 비밀번호를 다시 설정하시길 바랍니다.:<br><br><a class='btn' href='")//
					.append("http://localhost/WebProject/passwordForm.do?key=")// 가입 인증 url주소
					.append(reg_key)// 인증키값
					.append("' style='color:white;text-decoration:none;font-size:14px;border-radius:3px;background-color:#337ab7;padding:8px 12px;border:none'>비밀번호 재설정</a>")//
					.append("<br><p style='font-size:12px;color:#444444'><br><a href='http://").append(hostAddress)//
					.append("/WebProject/home.do'style='text-decoration: none; color: #333;'target='_blank';>TheLecture</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/tos.do'style='text-decoration: none; color: #333;'target='_blank';>이용약관</a> / <a href='http://")
					.append(hostAddress)//
					.append("/WebProject/privacy.do'style='text-decoration: none; color: #333;'target='_blank';>개인정보 처리방침</a> / <br></p></div></div>")
					.toString());//
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
	}

}
