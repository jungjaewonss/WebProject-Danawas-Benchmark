package danawa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import danawa.entity.Board;
import danawa.entity.GoodNickName;
import danawa.entity.ReWrite;
import danawa.pagemaker.Criteria;

@Mapper
public interface BoardMapper {

	List<Board> selectAll(Criteria cri);
	int insertBoard(Board board);
	int insertGood(Board board);
	int reWrite(ReWrite board);
	Board selectOne(Board board);
	Board selectOneNick(Board board);
	Board selectOneNickName(Board board);
	int updateBoard(Board board);
	int deleteBoard(Board board);
	void addCount(Board board); //조회수	
	void addGood(GoodNickName board); //좋아요수
	int updateAddGood(GoodNickName board);
	int myGoodCheck(GoodNickName board);
	int addTotalGood(Board board);
	List<ReWrite> selectReWrite(Board board);
	List<Board> myboard(Board board);
	int totalCount(Criteria cri);
	int deleteReBoard(Board board);
	int deleteGood(Board board);
	
	int TestDelete();
}
