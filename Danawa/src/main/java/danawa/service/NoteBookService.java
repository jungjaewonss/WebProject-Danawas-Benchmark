package danawa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danawa.entity.Mallinfo;
import danawa.entity.MyProduct;
import danawa.entity.NoteBookInfo;
import danawa.mapper.NoteBookMapper;
import danawa.pagemaker.Criteria;

@Service
public class NoteBookService {

	@Autowired
	private NoteBookMapper notebookmapper;
	
	public List<NoteBookInfo> allNoteBook(Criteria cri){
		return notebookmapper.allNoteBook(cri);
	}
	
	public List<Mallinfo> mallinfo(NoteBookInfo notebook){
		return notebookmapper.mallinfo(notebook);
	}
	
	public NoteBookInfo oneNoteBook(NoteBookInfo oneNotebook) {
		return notebookmapper.oneNoteBook(oneNotebook);
	}
	
	public List<Mallinfo> mallinfoDetail(NoteBookInfo notebook){
		return notebookmapper.mallinfo(notebook);
	}
	
	public List<NoteBookInfo> Classification(NoteBookInfo notebook , Criteria cri) {
		Map<String, Map<String,Object>> map = new HashMap<String, Map<String,Object>>();		
		Map<String, Object> hash = new HashMap<String, Object>();
		Map<String , Object> Page = new HashMap<String, Object>();
		
		Page.put("page", cri);
		
		if(!notebook.getCompany().isEmpty()) {
			hash.put("company", notebook.getCompany());
		}
		if(!notebook.getScreeninch().isEmpty()) {
			hash.put("screeninch", notebook.getScreeninch());
		}
		if(!notebook.getWeight().isEmpty()) {
			hash.put("weight", notebook.getWeight());
		}
		if(!notebook.getMemory().isEmpty()) {
			hash.put("memory", notebook.getMemory());
		}
		if(!notebook.getUsb().isEmpty()) {
			hash.put("usb", notebook.getUsb());
		}
		if(!notebook.getPurpose().isEmpty()) {
			hash.put("purpose", notebook.getPurpose());
		}
		if(!notebook.getThickness().isEmpty()) {
			hash.put("thickness", notebook.getThickness());
		}
		
		map.put("map", hash);
		map.put("page", Page);
		
		return notebookmapper.classificationNoteBook(map);
	}
	
	public int totalCount(NoteBookInfo notebook) {
		Map<String, Map<String,String>> map = new HashMap<String, Map<String,String>>();		
		Map<String, String> hash = new HashMap<String, String>();
		
		if(!notebook.getCompany().isEmpty()) {
			hash.put("company", notebook.getCompany());
		}
		if(!notebook.getScreeninch().isEmpty()) {
			hash.put("screeninch", notebook.getScreeninch());
		}
		if(!notebook.getWeight().isEmpty()) {
			hash.put("weight", notebook.getWeight());
		}
		if(!notebook.getMemory().isEmpty()) {
			hash.put("memory", notebook.getMemory());
		}
		if(!notebook.getUsb().isEmpty()) {
			hash.put("usb", notebook.getUsb());
		}
		if(!notebook.getPurpose().isEmpty()) {
			hash.put("purpose", notebook.getPurpose());
		}
		if(!notebook.getThickness().isEmpty()) {
			hash.put("thickness", notebook.getThickness());
		}
		
		map.put("map", hash);
		
		return notebookmapper.totalCount(map);
	}
	
	
	public int insertMyProduct(MyProduct myproduct) {
		return notebookmapper.insertMyProduct(myproduct);
	}
	
	public int deleteMyProduct(Map map) {
		return notebookmapper.deleteMyProduct(map);
	}
	
	public MyProduct duplicateCheck(MyProduct myproduct) {
		return notebookmapper.duplicateCheck(myproduct);
	}
	
	public int NotebookTotal() {
		return notebookmapper.NotebookTotal();
	}
	
	public List<NoteBookInfo> textsearch(Map<String, Object> textsearch){
		return notebookmapper.textsearch(textsearch);
	}
	
	public int textSearchCount(String textSearch) {
		return notebookmapper.textSearchCount(textSearch);
	}
}
