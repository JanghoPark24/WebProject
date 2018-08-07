package thelecture.model;

/**
 *  특이 사항: adjustEndRow_Page_andIndex()를 하면 
 *  startRow endrow countOfRow가 입력되면 다른 요소들이 그에 맞춰 조정됨.
 * 
 * */
//현재 페이지 값, 인덱스, 검색값
public class PageBean {

	// page
	private int currentPage; //현재 페이지
	private int startRow;
	private int endRow;
	private int indexPerBlk = 10; // 블록당 인덱스 개수
	private int rowPerPage=10; //페이지마다 row
	private int countOfRow; // 전체 row 개수
	private int totalPage;  // 전체 페이지
	
	
	//검색
	private String search;
	private String keyword;
	
	//아래 인덱스
	private int firstIndex; // 현재 페이지의 첫 인덱스
	private int lastIndex;  // 현재 페이지의 마지막 인덱스
	
	public PageBean() {
		
	}
	public void setPage_andRow(int currentPage, int countOfRow) {
		
		this.currentPage = currentPage;
		this.countOfRow = countOfRow;
		//row정의
		
		//현재 페이지 시작 줄
		startRow = 1+(rowPerPage*(currentPage-1));
		//현재 페이지 마지막 줄
		endRow = startRow+rowPerPage-1;
		if(endRow>countOfRow) endRow =countOfRow;
		
		//index 정의
		totalPage = (int) Math.ceil((double) countOfRow / rowPerPage);
		firstIndex = currentPage - (currentPage - 1) % rowPerPage;	// 1,  11, 21...
		lastIndex = firstIndex + indexPerBlk - 1;	// 10, 20, 30...
		
		if (lastIndex > totalPage)
			lastIndex = totalPage;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getIndexPerBlk() {
		return indexPerBlk;
	}

	public void setIndexPerBlk(int indexPerBlk) {
		this.indexPerBlk = indexPerBlk;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getCountOfRow() {
		return countOfRow;
	}

	public void setCountOfRow(int countOfRow) {
		this.countOfRow = countOfRow;
		
		
		
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	
}
	
	