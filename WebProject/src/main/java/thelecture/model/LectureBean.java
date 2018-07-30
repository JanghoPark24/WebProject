package thelecture.model;

public class LectureBean {
	private int lecture_id;
	private int semester;
	private String lecture_code;
	private String univ_name;
	private String major;
	private int view_count;
	private int rating_count;
	private String is_deleted; // y: 삭제됨 n:삭제되지않음(default)
 	private int total_avg_score;
 	
 	
 	
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getLecture_code() {
		return lecture_code;
	}
	public void setLecture_code(String lecture_code) {
		this.lecture_code = lecture_code;
	}
	public String getUniv_name() {
		return univ_name;
	}
	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getRating_count() {
		return rating_count;
	} 
	public void setRating_count(int rating_count) {
		this.rating_count = rating_count;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getTotal_avg_score() {
		return total_avg_score;
	}
	public void setTotal_avg_score(int total_avg_score) {
		this.total_avg_score = total_avg_score;
	}
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	
	
}
