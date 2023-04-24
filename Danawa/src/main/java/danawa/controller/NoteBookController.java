package danawa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import danawa.entity.Mallinfo;
import danawa.entity.MyProduct;
import danawa.entity.NoteBookInfo;
import danawa.pagemaker.Criteria;
import danawa.pagemaker.PageMaker;
import danawa.service.NoteBookService;

@Controller
@RequestMapping("/notebook")
public class NoteBookController {
	
	@Autowired
	private NoteBookService notebookservice;
	
	@GetMapping("/notebookList")
	public String notebookList(Model model, NoteBookInfo notebook , Criteria cri) {		
		List<NoteBookInfo> allNoteBook = notebookservice.allNoteBook(cri);
		
		PageMaker pageMaker = new PageMaker(cri);
		
		pageMaker.setTotalCount(notebookservice.NotebookTotal());
		
		Map<String,List<Mallinfo>> mallinfo = new HashMap<String, List<Mallinfo>>();
		
		for(int i = 0; i < allNoteBook.size(); i++) {			//제목
			List<Mallinfo> resultmall = notebookservice.mallinfo(allNoteBook.get(i));			
					
			mallinfo.put(allNoteBook.get(i).getSubject(), resultmall);			
		}
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("map" , mallinfo);
		model.addAttribute("allnotebook", allNoteBook);				
		
		return "notebookList";
	}
	
	@GetMapping("/detailNoteBook")
	public String detailNoteBook(NoteBookInfo notebook , Model model) {
		NoteBookInfo oneNotebook = notebookservice.oneNoteBook(notebook);
		
		List<Mallinfo> mallinfoDetail =  notebookservice.mallinfoDetail(oneNotebook);
		
		model.addAttribute("oneNotebook", oneNotebook);
		model.addAttribute("mallinfoDetail", mallinfoDetail);
		
		return "detailNoteBook";
	}
	
	@GetMapping("/checkNotebook")
	public String checkNotebook(NoteBookInfo notebook , Model model , Criteria cri) {		
		Map map = new HashMap<String, Object>();
		
		List<NoteBookInfo> classification = notebookservice.Classification(notebook , cri);
		PageMaker pageMaker = new PageMaker(cri);
		
		pageMaker.setTotalCount(notebookservice.totalCount(notebook));
		
		Map<String,List<Mallinfo>> mallinfo = new HashMap<String, List<Mallinfo>>();
		
		for(int i = 0; i < classification.size(); i++) {			//제목
			List<Mallinfo> resultmall = notebookservice.mallinfo(classification.get(i));			
					
			mallinfo.put(classification.get(i).getSubject(), resultmall);			
		}
		
		model.addAttribute("notebook",notebook);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("map" , mallinfo);
		model.addAttribute("classification", classification);	
		
		return "notebookList";
	}
	
	@ResponseBody
	@GetMapping("/addMyProduct")
	public int addMyProduct(MyProduct myproduct) {	
		MyProduct product = notebookservice.duplicateCheck(myproduct);
		if(product != null) return 0;
		
		return notebookservice.insertMyProduct(myproduct);		
	}
	
	@ResponseBody
	@GetMapping("/deleteMyProduct")
	public int deleteMyProduct(@RequestParam String data , MyProduct memIdx) {
		Map map = new HashMap<String, Object>();
		
		String [] datas = data.split(",");
		List<String> datass = new ArrayList<String>();
				
		for(int i = 0 ; i < datas.length; i++) {
			datass.add(datas[i]);
		}		
		
		map.put("memIdx", memIdx);
		map.put("mydata", datass);
			 
		return notebookservice.deleteMyProduct(map);		 
	}
	
	@GetMapping("/textsearch")
	public String textsearch(String mainSearch, Criteria cri, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("textSearch", mainSearch);
		map.put("cri", cri);
		
		List<NoteBookInfo> search = notebookservice.textsearch(map);
		
		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalCount(notebookservice.textSearchCount(mainSearch));
		
		Map<String,List<Mallinfo>> mallinfo = new HashMap<String, List<Mallinfo>>();
				
		for(int i = 0; i < search.size(); i++) {			//제목
			List<Mallinfo> resultmall = notebookservice.mallinfo(search.get(i));			
					
			mallinfo.put(search.get(i).getSubject(), resultmall);			
		}
		NoteBookInfo notebook = new NoteBookInfo();
				
		model.addAttribute("textsearch",mainSearch);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("map" , mallinfo);
		model.addAttribute("classification", search);
		
		return "notebookList";
	}
}
