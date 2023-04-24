package danawa.mapper;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import danawa.entity.Mallinfo;
import danawa.entity.NoteBookInfo;
import danawa.pagemaker.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoteBookMapperTest {
	
	@Autowired
	private NoteBookMapper notebookMapper;
	
	@Test()
	public void 노트북_전체리스트_테스트() {
		List<NoteBookInfo> allNoteBook = notebookMapper.allNoteBook(new Criteria());
		
		Assertions.assertThat(allNoteBook).isNotNull();
	}
	
	@Test()
	public void 노트북별_몰정보_테스트() {
		List<NoteBookInfo> allNoteBook = notebookMapper.allNoteBook(new Criteria());
		
		List<Mallinfo> mallinfo = notebookMapper.mallinfo(allNoteBook.get(0));
		
		Assertions.assertThat(mallinfo).isNotNull();
	}
	
	@Test()
	public void 노트북_하나검색_테스트() {
		NoteBookInfo notebook = new NoteBookInfo();
		
		notebook.setSubject("레노버 아이디어패드 Slim3-15IAU7 5D WIN11 16GB램 (SSD 256GB)");		
		NoteBookInfo oneNotebook = notebookMapper.oneNoteBook(notebook);
		
		Assertions.assertThat(oneNotebook.getSubject()).isEqualTo(notebook.getSubject());		
	}
}
