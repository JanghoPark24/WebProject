package thelecture.model;

import java.util.List;

public class QuestionBean {
	private Integer question_id;
	private String question_version;
	private String question_content;
	
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
	
}
