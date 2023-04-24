package danawa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import danawa.entity.Mallinfo;
import danawa.entity.MyProduct;
import danawa.entity.NoteBookInfo;
import danawa.pagemaker.Criteria;

@Mapper
public interface NoteBookMapper {
	List<NoteBookInfo> allNoteBook(Criteria cri);
	List<Mallinfo> mallinfo(NoteBookInfo notebook);
	NoteBookInfo oneNoteBook(NoteBookInfo oneNotebook);
	List<Mallinfo> mallinfoDetail(NoteBookInfo notebook);
	List<NoteBookInfo> classificationNoteBook(Map<String, Map<String,Object>> map);
	int insertMyProduct(MyProduct myproduct);
	int deleteMyProduct(Map map);
	MyProduct duplicateCheck(MyProduct myproduct);
	int NotebookTotal();
	int totalCount(Map<String, Map<String,String>> map);
	List<NoteBookInfo> textsearch(Map<String, Object> searchText);
	int textSearchCount(String searchText);
}
