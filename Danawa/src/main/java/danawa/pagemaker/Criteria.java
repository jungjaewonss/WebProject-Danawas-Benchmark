package danawa.pagemaker;

import lombok.Data;

@Data
public class Criteria {
	private int nowPage; //현제페이지
	private int pagePerNum; // 한페이지당 몇개의 게시물을보여줄것인지
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this.nowPage = 1;
		this.pagePerNum =5;
	}
	
	//페이지별 시작 게시물번호를 구하는메소드
	public int getPageStart() {
		return (nowPage-1) * pagePerNum;
	}
}
