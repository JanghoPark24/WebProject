package thelecture.model;

import java.sql.Date;

public class MemberBean{
	private String email;
	private String nickname;
	private String univ_name;
	private String password;
	private String is_mail_open;
	private String grade;
	private int fail_count;
	private Date try_date;
	private String reg_key;
	private Date reg_date;
	private String major;
	private String profile_img;
	private String profile;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUniv_name() {
		return univ_name;
	}
	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIs_mail_open() {
		return is_mail_open;
	}
	public void setIs_mail_open(String is_mail_open) {
		this.is_mail_open = is_mail_open;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getFail_count() {
		return fail_count;
	}
	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}
	public Date getTry_date() {
		return try_date;
	}
	public void setTry_date(Date try_date) {
		this.try_date = try_date;
	}
	public String getReg_key() {
		return reg_key;
	}
	public void setReg_key(String reg_key) {
		this.reg_key = reg_key;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "MemberBean[email="+email+",nickname="+nickname+",univ_name="+univ_name+",major="+major+"]";
	}
	
	
	
}
