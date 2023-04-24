package danawa.entity;

import danawa.entity.kakaoDevel.kakaoProfile;
import lombok.Data;

@Data
public class Member {
	private String memIdx;
	private String memId;
	private String memPassword;
	private String memName;
	private String memNickName;
	private String memPhone;
	private String memProfile;

	public Member KakaoSetMember(kakaoProfile kakaoprofile) { 
		  this.memId =kakaoprofile.getKakao_account().getEmail();
		  this.memName = kakaoprofile.getProperties().getNickname();
		  this.memNickName =kakaoprofile.getProperties().getNickname();
		  this.memProfile = kakaoprofile.getKakao_account().getProfile().getThumbnail_image_url();
		  this.memPhone = "";
		  return this; 
	  }

	public Member(String memId, String memPassword, String memName, String memNickName, String memPhone,
			String memProfile) {
		super();
		this.memId = memId;
		this.memPassword = memPassword;
		this.memName = memName;
		this.memNickName = memNickName;
		this.memPhone = memPhone;
		this.memProfile = memProfile;
	}

	public Member() {
	}

}
