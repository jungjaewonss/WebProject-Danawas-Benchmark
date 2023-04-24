package danawa.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danawa.entity.Board;
import danawa.entity.GoodNickName;
import danawa.entity.ReWrite;
import danawa.mapper.BoardMapper;
import danawa.pagemaker.Criteria;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
		
	public int insertBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	public List<Board> selectAll(Criteria cri){
		return boardMapper.selectAll(cri);
	}

	public Board selectOne(Board board) {
		return boardMapper.selectOne(board);
	}
	
	public Board selectOneNick(Board board) {
		return boardMapper.selectOneNick(board);
	}
	
	public int updateBoard(Board board) {
		return boardMapper.updateBoard(board);
	}
	
	public int deleteBoard(Board board) {
		return boardMapper.deleteBoard(board);
	}
	
	public void addCount(Board board) {
		boardMapper.addCount(board);
	}
	
	public void addGood(GoodNickName board) {
		boardMapper.addGood(board);
	}
	
	public int myGoodCheck(GoodNickName board) {
		return boardMapper.myGoodCheck(board);
	}
	
	public int insertGood (Board board) {
		return boardMapper.insertGood(board);
	}
	
	public int updateAddGood(GoodNickName board) {
		return boardMapper.updateAddGood(board);
	}
	
	public int addTotalGood(Board board) {
		return boardMapper.addTotalGood(board);
	}
	
	public Board selectOneNickName(Board board) {
		return boardMapper.selectOneNickName(board);
	}
	
	public int reWrite(ReWrite board) {
		return boardMapper.reWrite(board);
	}
	
	public List<ReWrite>selectReWrite(Board board){
		return boardMapper.selectReWrite(board);
	}
	
	public List<Board> myboard(Board board){
		return boardMapper.myboard(board);
	}
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}
	public int deleteReBoard(Board board) {
		return boardMapper.deleteReBoard(board);
	}
	public int deleteGood(Board board) {
		return boardMapper.deleteGood(board);
	}
}
