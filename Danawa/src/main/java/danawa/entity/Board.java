package danawa.entity;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {

	private int boIdx;
	private String memId;
	private String boTitle;
	private String boContent;
	private int boCount;
	private String boNickName;
	private String boPassword;
	private int boGood;	
	private String boDate;
	
	private int boGroup;
	private int boSequence;
	private int boLevel;
	
	
	private String goNickName;
	private int goCount;
	
	public Board(String memId, String boTitle, String boContent, String boNickName) {
		super();
		this.memId = memId;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.boNickName = boNickName;
	}
	
	
}
