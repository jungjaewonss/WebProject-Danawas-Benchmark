package danawa.pagemaker;

import lombok.Data;

@Data
public class PageMaker {
	private Criteria cri;
	private int totalCount; //디비에 꺼내와서 셋해주고
	
	private int startPage; //밑에있는 페이징처리블럭 의 시작번호
	private int endPage; // 끝번호 의경우에는 마지막페이지에 남는것들이있기대문에 조정이필요하다.
	
	private boolean prev; // 이전 버튼을 만들것인가
	private boolean next; // 다음버튼을 반들것인가
	
	private int displayPageNum = 5; // 하단에 몇개씩 페이지블럭을보여줄것인가.
	
	
	
	//총게시글의 수를 구하는 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		makePaging();
	}

	private void makePaging() {
		//1.화면에 보여질 마지막 페이지번호
		int now = cri.getNowPage(); 
		this.endPage =  (int)(Math.ceil(now/(double)displayPageNum) * displayPageNum);
		
		//2.화면에 보여질 시작페이지번호
		this.startPage = endPage - displayPageNum +1;		
		if(startPage <= 0) startPage = 1;
		
		//3 전체 마지막 페이지계산 
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPagePerNum()));
		
		//4 화면에 보여질 마지막 페이지 유혀성체트
		if(tempEndPage < endPage) {
			endPage = tempEndPage;
		}
		
		//5 이전페이지 버튼 링크 존재여부
		prev = (startPage == 1) ? false : true;
		next = (endPage < tempEndPage) ? true : false;
	}

	public PageMaker(Criteria cri) {
		super();
		this.cri = cri;
	}
	
}
 