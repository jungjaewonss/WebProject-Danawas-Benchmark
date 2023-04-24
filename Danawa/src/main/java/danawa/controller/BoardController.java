package danawa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import danawa.entity.Board;
import danawa.entity.GoodNickName;
import danawa.entity.ReWrite;
import danawa.pagemaker.Criteria;
import danawa.pagemaker.PageMaker;
import danawa.service.BoardService;
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public String boardList(Criteria cri , Model model) {		
		List<Board> resultBoard =  boardService.selectAll(cri);
	
		model.addAttribute("allList", resultBoard);
		
		//페이징 처리에 필요한 부분
		PageMaker pageMaker = new PageMaker(cri);
		
		pageMaker.setTotalCount(boardService.totalCount(cri));
		System.out.println(pageMaker.getTotalCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "boardList";
	}
	
	@GetMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(Board board , Model model , Criteria cri) {
		//조회수증가
		boardService.addCount(board);
				
		Board result = boardService.selectOneNickName(board);
		
		if(result == null) {
			board.setGoNickName(null);
		}
		else {
			board.setGoNickName(result.getGoNickName());
		}
		//게시물하나가져오기
		Board resultBoard = boardService.selectOne(board);
		
		List<ReWrite> reWriteBoard = boardService.selectReWrite(board);
				
		model.addAttribute("detailBoard", resultBoard);
		model.addAttribute("reWriteBoard", reWriteBoard);
		model.addAttribute("cri", cri);
		return "detailBoard";
	}
	
	@GetMapping("/addGoodBoard")
	public String addGoodBoard(Board board , Model model) {
		//해당게시물의 좋아요 총 개수
		boardService.addTotalGood(board);
		
		Board resultBoarrd =boardService.selectOneNick(board);
		List<ReWrite> reWriteBoard = boardService.selectReWrite(board);
				
		model.addAttribute("detailBoard", resultBoarrd);
		model.addAttribute("reWriteBoard", reWriteBoard);

		return "detailBoard";
	}
	
	@ResponseBody
	@GetMapping("/boardRewrite")
	public int boardRewrite(ReWrite rewrite) {
		return boardService.reWrite(rewrite);		
	}
	
	//좋아요를 누르면 좋아요개수 추가
	@ResponseBody
	@GetMapping("/addGood")
	public void addGood(GoodNickName goodNickName) {		
		boardService.updateAddGood(goodNickName);				
	}
	
	@ResponseBody
	@GetMapping("/myGoodCheck")
	public int myGoodCheck(GoodNickName board) {
		return boardService.myGoodCheck(board);
	}
	
	@PostMapping("/write")
	public String write(Board board) {	
		boardService.insertBoard(board);
		boardService.insertGood(board);
		
		return "redirect:/board/boardList";
	}
	
	@ResponseBody
	@PostMapping("/update")	
	public int update(Board board) {
		int result = boardService.updateBoard(board);	
		return result;
	}
	
	@ResponseBody
	@PostMapping("/deleteBoard")
	public int deleteBoard(Board board) {
		boardService.deleteGood(board);
		boardService.deleteReBoard(board);
		return boardService.deleteBoard(board);
	}
	
	@ResponseBody
	@GetMapping("/myboard")
	public List<Board> myboard(Board board){				
		List<Board> myboard =  boardService.myboard(board);

		return myboard;
	}
}
