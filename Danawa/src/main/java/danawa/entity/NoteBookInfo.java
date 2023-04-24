package danawa.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoteBookInfo {
	private String subject = "";
	private String screeninch = ""; 
	private String weight = "" ;
	private String company = "" ;
	private String price = ""; 
	private String img = "";
	private String memory = "";
	private String usb = "";
	private String purpose = ""; //용도
	private String thickness = ""; //두께
	private String allinfo = "";
	
	private String url = "http://prod.danawa.com/list/?cate=112758&15main_11_02";
    	
	public NoteBookInfo() {
		// TODO Auto-generated constructor stub
	}	
	public NoteBookInfo(String subject, String screeninch, String weight, String company, String price, String img,
			String memory, String usb, String purpose, String thickness, String allinfo) {
		super();
		this.subject = subject;
		this.screeninch = screeninch;
		this.weight = weight;
		this.company = company;
		this.price = price;
		this.img = img;
		this.memory = memory;
		this.usb = usb;
		this.purpose = purpose;
		this.thickness = thickness;
		this.allinfo = allinfo;
	}
}