package danawa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CrawlingController {
	@Autowired
	private danawa.service.CrawlingService crawlingService;
	
	@GetMapping("/Crawling")
	public void Crawling() throws Exception{
		crawlingService.CrawlingMallinfo();
	}
}
