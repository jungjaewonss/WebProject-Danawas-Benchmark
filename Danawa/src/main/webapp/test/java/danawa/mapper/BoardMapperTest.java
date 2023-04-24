package danawa.mapper;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import danawa.entity.Board;
import danawa.entity.Member;
import danawa.entity.ReWrite;
import danawa.pagemaker.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
			
	@Test()
	public void 게시판_전체리스트_테스트() {
		Criteria cri = new Criteria();
		
		List<Board> board = boardMapper.selectAll(cri);

		Assertions.assertThat(board.size()==cri.getPagePerNum());
	}
	
	@Test()
	public void 게시물하나_선택_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		Board oneBoard = boardMapper.selectOne(board);
		
		Assertions.assertThat(board.getBoIdx()).isEqualTo(oneBoard.getBoIdx());
	}
	
	@Test()
	public void 게시물_변경_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		board.setBoTitle("2"); 
		board.setBoContent("2");
		boardMapper.updateBoard(board);
		Board oneBoard = boardMapper.selectOne(board);
		
		Assertions.assertThat(oneBoard.getBoTitle()).isEqualTo("2");
		Assertions.assertThat(oneBoard.getBoContent()).isEqualTo("2");
	}
	
	@Test()
	public void 게시물_삭제_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		boardMapper.deleteBoard(board);
		Board delteBoard = boardMapper.selectOne(board);
		
		Assertions.assertThat(delteBoard).isNull();
	}
	
	@Test()
	public void 게시물_조회수증가_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		boardMapper.addCount(board);
		Board addCountBoard = boardMapper.selectOne(board);
		
		Assertions.assertThat(addCountBoard.getBoCount()==1);
	}
	
	@Test()
	public void 게시물_좋아요증가_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());		
		boardMapper.insertBoard(board);		
		
		boardMapper.addTotalGood(board);		
		Board goodboard = boardMapper.selectOne(board);
		
		Assertions.assertThat(goodboard.getBoGood() == 1);		
	}
	
	@Test()
	public void 게시물_댓글장성_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		ReWrite re = new ReWrite();
		re.setBoGroup(board.getBoIdx());
		re.setReContent("댓글");
		boardMapper.reWrite(re);
				
		List<ReWrite> allRe = boardMapper.selectReWrite(board);
		
		Assertions.assertThat(allRe.get(0).getReContent()).isEqualTo("댓글");
	}
	
	@Test()
	public void 게시믈_해당하는게시물댓글불러오기_테스트() {
			Member member = new Member("1","1","1","1","1","1"); 				
			Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
			boardMapper.insertBoard(board);
			
			ReWrite re = new ReWrite();
			re.setBoGroup(board.getBoIdx());
			re.setReContent("댓글");
			boardMapper.reWrite(re);
					
			List<ReWrite> allRe = boardMapper.selectReWrite(board);
			
			Assertions.assertThat(allRe).isNotNull();
	}
	

	
	@Test()
	public void 게시물_댓글삭제_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Board board = new Board(member.getMemId(),"title","content",member.getMemNickName());
		boardMapper.insertBoard(board);
		
		int result = boardMapper.deleteReBoard(board);
		
		Assertions.assertThat(result >= 1);
	}	
}
