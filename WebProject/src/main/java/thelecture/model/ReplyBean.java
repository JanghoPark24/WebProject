package thelecture.model;
import java.util.Date;


/*
 * lecture_reply
 * community_board_reply
 * 
 * */
public class ReplyBean{
	
	private String nickname;
	private int reply_num;
	private int semester;
	private int lecture_id; //lecture_reply 
	private String email;
	private int likes;
	private int ref;
	private int depth;
	private String content;
	private Date reg_date;
	private String is_deleted; // y: 삭제됨 , n:삭제되지 않음(default)
	private String uploadedFile; // 프로필 이미지명
	private String reply_order; // 순서
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(Integer lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUploadedFile() {
		return uploadedFile;
	}
	public void setUploadedFile(String uploadedFile) {
		this.uploadedFile = uploadedFile;
	}
	public String getReply_order() {
		return reply_order;
	}
	public void setReply_order(String reply_order) {
		this.reply_order = reply_order;
	}
	/**
	 * @return the likes
	 */
	public int getLikes() {
		return likes;
	}
	/**
	 * @param likes the likes to set
	 */
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
}
