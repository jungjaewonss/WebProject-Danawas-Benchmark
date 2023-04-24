package danawa.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import danawa.entity.Member;
import danawa.entity.MyProduct;

@Mapper
public interface MemberMapper {		
	int joinMember(Member member);
	int memIdCheck(Member member);
	Member memLogin(Member member);	
	Member oneMember(Member member);
	List<MyProduct> myItem(Map<String, Object> map);
	int updateInfo(Member member);
	int myItemTotalCount(Member member);
	String oldProfile(String profile);
	int updateProfile(Member member);
	int deleteMember(String memid);
	Member findById(String memId);
	
}
