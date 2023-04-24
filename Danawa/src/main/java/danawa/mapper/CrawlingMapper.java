package danawa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import danawa.entity.Mallinfo;
import danawa.entity.NoteBookInfo;

@Mapper
public interface CrawlingMapper {

	void InsertMallInfo(List<Mallinfo> mallinfo);
	void InsertNoteBook(NoteBookInfo notebookinfo);
	List<NoteBookInfo> samSung();
	List<NoteBookInfo> renova();
	List<NoteBookInfo> lg();
}
