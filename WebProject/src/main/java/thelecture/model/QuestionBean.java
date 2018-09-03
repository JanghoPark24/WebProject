package thelecture.model;

import java.util.List;

public class QuestionBean{
	
	private Integer lecture_id;
	private Integer question_id;
	private String email;
	private String question_version;
	private String question_content;
	private int question_value;
	
	public String getQuestion_version() {
		return question_version;
	}
	public void setQuestion_version(String question_version) {
		this.question_version = question_version;
	}
	public Integer getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content =question_content;
	}
	
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(Integer lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQuestion_value() {
		return question_value;
	}
	public void setQuestion_value(int question_value) {
		this.question_value = question_value;
	}
	
}
