package danawa.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Mallinfo {
 
	private String modelnum;
	private String link;
	private String logo;
	private int price;
	private String shipping;
	private String mallname; 
}
