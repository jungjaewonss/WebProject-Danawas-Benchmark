package danawa.mapper;
import org.assertj.core.api.Assertions;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import danawa.entity.Member;
import lombok.extern.log4j.Log4j;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {
	
	@Autowired
	private  MemberMapper memberMapper;
	

	@After
	public void 초기화() {		
		memberMapper.deleteMember("1");
	}
	
	@Before
	public void 회원생성() {
		Member member = new Member("1","1","1","1","1","1"); 				
		memberMapper.joinMember(member);		
	}
	
	@Test()
	public void 회원_회원가입_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		//when
		int result = memberMapper.joinMember(member);		
		//then
		Assertions.assertThat(result).isEqualTo(1);
	}
	
	@Test()
	public void 회원_아이디중복확인_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		
		int result = memberMapper.memIdCheck(member);
		
		Assertions.assertThat(result >= 1);
	}
	
	@Test()
	public void 회원_로그인_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		
		Member loginMember = memberMapper.memLogin(member);

		Assertions.assertThat(loginMember).isNotNull();
	}
	
	@Test()
	public void 회원_한명불러오기_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		
		Member findId = memberMapper.findById(member.getMemId());
		Member oneMember = memberMapper.oneMember(findId);
		
		Assertions.assertThat(member.getMemId()).isEqualTo(oneMember.getMemId());
	}
	
	@Test()
	public void 내_프로필불러오기_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Member findMember = memberMapper.findById(member.getMemId());

		String profile = memberMapper.oldProfile(findMember.getMemIdx());
		
		Assertions.assertThat(profile).isNull();
	}
	
	@Test()
	public void 내_프로필변경_테스트() {
		Member member = new Member("1","1","1","1","1","1"); 				
		Member findMember = memberMapper.findById(member.getMemId());
		member.setMemIdx(findMember.getMemIdx());
		
		memberMapper.updateProfile(member);
		Member mem = memberMapper.oneMember(member);
		
		Assertions.assertThat(mem.getMemProfile()).isEqualTo("1");
	}
	
	@Test()
	public void 회원_정보수정_테스트() {
		Member member = new Member("1","2","2","2","2","2");
		
		Member findMember = memberMapper.findById(member.getMemId());
		member.setMemIdx(findMember.getMemIdx());
		memberMapper.updateInfo(member);
		
		Assertions.assertThat(member.getMemPassword()).isEqualTo("2");
		Assertions.assertThat(member.getMemNickName()).isEqualTo("2");
	}	
}