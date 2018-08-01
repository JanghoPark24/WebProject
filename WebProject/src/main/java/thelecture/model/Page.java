package thelecture.model;


public class Page {

	// page
	private int startRow;
	private int endRow;
	
	
	//검색
	private String search;
	private int keyword;
	
	//아래 인덱스
	private int firstIndex;
	private int lastIndex;
	
	public Page(int startRow , int rowPerPage) {
		
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getKeyword() {
		return keyword;
	}
	public void setKeyword(int keyword) {
		this.keyword = keyword;
	}
	
	
}
	
	