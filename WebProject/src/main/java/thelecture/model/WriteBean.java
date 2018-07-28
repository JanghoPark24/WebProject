package thelecture.model;

public class WriteBean {

	private	int univ_name;			//대학이름
	private String	email;			//이메일
	private String	subject;		//제목
	private String	content;		//내용
	private	int	view_count;			//조회수
	private	int	reg_date;			//등록날짜
	private	String	is_deleted;		//삭제여부
	private	int	board_num;			//게시판번호
	
	public int getUniv_name() {
		return univ_name;
	}
	public void setUniv_name(int univ_name) {
		this.univ_name = univ_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getReg_date() {
		return reg_date;
	}
	public void setReg_date(int reg_date) {
		this.reg_date = reg_date;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
