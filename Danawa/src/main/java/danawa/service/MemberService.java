package danawa.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import danawa.entity.Member;
import danawa.entity.MyProduct;
import danawa.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper membermapper;
	
	
	public int join(Member member) {
		return membermapper.joinMember(member);
	}
	
	public int memIdCheck(Member member) {
		return membermapper.memIdCheck(member);
	}
	
	public boolean memLoginCheck(Member member , HttpSession session) {
		
		Member LoginMember = membermapper.memLogin(member);		
		
		if(LoginMember != null) {
			session.setAttribute("mem", LoginMember);
			return true;
		}		
		return false;
	}
	
	public Member oneMember(Member member) {
		return membermapper.oneMember(member);
	}
	
	public List<MyProduct> myItem(Map<String, Object> map) {
		return membermapper.myItem(map);
	}
	
	public int updateInfo(Member member) {
		return membermapper.updateInfo(member);
	}
	
	public int myItemTotalCount(Member member) {
		return membermapper.myItemTotalCount(member);
	}
	
	public String oldProfile(String profile) {
		return membermapper.oldProfile(profile);
	}
	
	public int updateProfile(Member member) {
		return membermapper.updateProfile(member);
	}
	
	public String uploadFile(HttpServletRequest req , RedirectAttributes rttr , HttpSession session) {
		
		MultipartRequest multi = null;
		int fileMaxSize = 10*1024*1024; // 10MB
		String savePath = req.getRealPath("resources/upload");

		try {
			multi = new MultipartRequest(req, savePath,fileMaxSize,"UTF-8",new DefaultFileRenamePolicy());
		}catch (Exception e) {
			rttr.addFlashAttribute("msg", "파일의 크기는 10MB를 넘을수 없습니다.");
			return "redirect:/member/profileForm";
		}
		
		//데이터베이스 테이블에 회원이미지를 업데이트
		String memIdx = multi.getParameter("memIdx");
		String newProfile = "";
		File file = multi.getFile("memProfile");
		
		if(file != null) { //업로드가 정상적으로된거임 .png .jpg .gif 만되야함
			// 이미지 파일 여부를 체크하고 이미지가아니면 삭제
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			ext = ext.toUpperCase();
			
			if(ext.equals("PNG") || ext.equals("JPG") || ext.equals("GIF")) {
				//새로업로드된이미지 , 현재DB 있는이미지 old
				String oldFile = membermapper.oldProfile(memIdx);
				File oldProfile = new File(savePath+"/"+oldFile);
				
				if(oldProfile.exists()) {
					oldProfile.delete();
				}
				newProfile=file.getName();
			}
			else { // 이미지 파일이 아니면 이미지를 삭제
				if(file.exists()) {
					file.delete(); // 파일삭제
				}
				rttr.addFlashAttribute("msg", "이미지 파일만 업로드 가능합니다.");
			}
		}
		
		// 새로운이미지 디비업로드
		Member member = new Member();
		
		member.setMemIdx(memIdx);
		member.setMemProfile(newProfile);
		
		membermapper.updateProfile(member);		
		Member newmember = membermapper.oneMember(member);
		
		session.setAttribute("mem", newmember);
		return "redirect:/";
	}
	
	public Member findByid(Member member) {
		return membermapper.findById(member.getMemId());
	}
}
