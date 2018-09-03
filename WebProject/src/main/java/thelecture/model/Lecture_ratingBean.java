package thelecture.model;

public class Lecture_ratingBean {
	private String lecture_id;
	private String question_content;
	private int question_id;
	private String question_version;
	private float avg_score;
	
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public float getAvg_score() {
		return avg_score;
	}
	public void setAvg_score(float avg_score) {
		this.avg_score = avg_score;
	}
	public String getQuestion_version() {
		return question_version;
	}
	public void setQuestion_version(String question_version) {
		this.question_version = question_version;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	
	
}
