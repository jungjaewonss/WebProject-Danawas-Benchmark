package danawa.controller;
import java.io.IOException;
import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import danawa.entity.Member;
import danawa.entity.MyProduct;
import danawa.entity.kakaoDevel.OauthToken;
import danawa.entity.kakaoDevel.kakaoProfile;
import danawa.pagemaker.Criteria;
import danawa.pagemaker.PageMaker;
import danawa.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@ResponseBody
	@GetMapping("/kakaoLogin")
	public ResponseEntity kakaoLogin(String code , HttpSession session) {
		
		RestTemplate rest1 = new RestTemplate();
		 rest1.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		 rest1.setErrorHandler(new DefaultResponseErrorHandler() {
		        public boolean hasError(ClientHttpResponse response) throws IOException {
		            HttpStatus statusCode = response.getStatusCode();
		            return statusCode.series() == HttpStatus.Series.SERVER_ERROR;
		        }
		    });
		
		//header
		HttpHeaders headers1 = new HttpHeaders();
		headers1.set("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		
		
		//body
		MultiValueMap<String, String> param1 = new LinkedMultiValueMap<String, String>();
		param1.add("grant_type","authorization_code");
		param1.add("client_id","c90c783e6393c5a0e9000996e8b12e51");
		param1.add("redirect_uri","http://193.123.228.237/member/kakaoLogin");
		param1.add("code", code);
		
		
		HttpEntity<MultiValueMap<String, String>> kakaoRequest1 = 
				 new HttpEntity<>(param1,headers1);
		
		 ResponseEntity<OauthToken> response =	rest1.exchange(
				"https://kauth.kakao.com/oauth/token", 
				HttpMethod.POST,
				kakaoRequest1, 
				OauthToken.class
				);
		
		OauthToken token = response.getBody();
		
		//토큰발급완료 사용자 정보가져오기
		RestTemplate sendToken = new RestTemplate();
		 
		sendToken.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		sendToken.setErrorHandler(new DefaultResponseErrorHandler() {
		        public boolean hasError(ClientHttpResponse response) throws IOException {
		            HttpStatus statusCode = response.getStatusCode();
		            return statusCode.series() == HttpStatus.Series.SERVER_ERROR;
		        }
		    });
		
		
		HttpHeaders userHeader = new HttpHeaders();
		userHeader.add("Authorization","Bearer "+token.getAccess_token());
		
		
		HttpEntity<MultiValueMap<String, String>> userInfo = 
				 new HttpEntity<>(userHeader);
		
		ResponseEntity<String> entity = sendToken.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.GET,
				userInfo,
				String.class
				);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		kakaoProfile kakaoProfile = null;

		try {
			kakaoProfile = objectMapper2.readValue(entity.getBody(), kakaoProfile.class);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		Member member = new Member();
		member.KakaoSetMember(kakaoProfile);
		
		int result = memberService.memIdCheck(member);
		
		if(result == 0) {
			UUID gabagePassword = UUID.randomUUID(); 
			member.setMemPassword(gabagePassword.toString());		
			memberService.join(member);
			memberService.memLoginCheck(member, session);
		}else {
			Member my = memberService.findByid(member);
			memberService.memLoginCheck(my, session);
		}
				
		  HttpHeaders headers = new HttpHeaders();
	      headers.setLocation(URI.create("http://193.123.228.237"));
	        
	      return new ResponseEntity(headers, HttpStatus.MOVED_PERMANENTLY);
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(Member member) {		
		memberService.join(member);
			
		return "redirect:/member/loginForm";
	}
	
	
	@PostMapping("/login")
	public String login(Member member , HttpSession session , RedirectAttributes rttr, String memIdCheck , String memPasswordCheck) {
				
		boolean result = memberService.memLoginCheck(member, session);
		
		if(result == true) {			
			rttr.addFlashAttribute("msg", "로그인이성공하였습니다.");
			return "redirect:/";
		}
		
		rttr.addFlashAttribute("msg", "아이디비밀번호를 확인해주세요");
		
		return "redirect:/member/loginForm";
	}
		
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/findMyInfoForm")
	public String findMyInfoForm() {
		return "findMyInfoForm";
	}
	
	@GetMapping("/updateMemberForm")
	public String updateMember(Member member , Model model) {
		Member my = memberService.oneMember(member);
		
		model.addAttribute("myinfo", my);
		
		return "updateMemberForm";
	}
	
	@GetMapping("/myPage")
	public String myPage(Member member,Criteria cri,Model model) {		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("member", member);
		//관심상품한 내 아이템 가져오기
		List<MyProduct> myItem = memberService.myItem(map); //관심상품등록한내물건
		
		//페이징 처리를하기 위한 페이징 객체생성
		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalCount(memberService.myItemTotalCount(member));
		
		//마이페이지에 내 정보를 뿌려주기위해 내 정보 받아오기
		Member myInfo = memberService.oneMember(member); 
						
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("myItem", myItem);
		model.addAttribute("pageMaker", pageMaker);
		
		return "mypage";
	}
	
	@GetMapping("/profileForm")
	public String profileForm() {
		return "profileForm";
	}
	
	//회원프로필 업로드
	@PostMapping("/ProfileUpdate")
	public String ProfileUpdate(HttpServletRequest req , RedirectAttributes rttr, HttpSession session) {				
		
		return memberService.uploadFile(req,rttr,session);
	}
	
	@ResponseBody
	@PostMapping("/updateInfo")
	public int updateInfo(Member myinfo) {
		return memberService.updateInfo(myinfo);
	}
	
	@ResponseBody
	@GetMapping("/memIdCheck")
	public int memIdCheck(Member member) {
		return memberService.memIdCheck(member);
	}
	
}
