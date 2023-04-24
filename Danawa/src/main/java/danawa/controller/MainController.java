package danawa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import danawa.entity.NoteBookInfo;
import danawa.service.CrawlingService;
import danawa.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private CrawlingService cs; 
	@Autowired 
	private MemberService ms;
	
	@GetMapping("/")
	public String main(Model model) {		
	//삼성 LG 레노버에 해당하는 노트북 가져오기
	List<NoteBookInfo> samsung = cs.samSung();
	List<NoteBookInfo> lg =	cs.lg();
	List<NoteBookInfo> renova =	cs.renova();
	
	
	
	model.addAttribute("samsung", samsung);
	model.addAttribute("lg", lg);
	model.addAttribute("renova", renova);
	
	return "main";
	}
}
