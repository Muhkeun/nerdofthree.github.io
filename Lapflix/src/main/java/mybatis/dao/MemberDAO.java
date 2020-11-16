package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.MemberVO;

@Component
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//회원가입
	public void add(String name, String age, String gender, String email, String p_image, String password ) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("member_name", name);
		map.put("member_age", age);
		map.put("member_gender", gender);
		map.put("email", email);
		map.put("profile_image", p_image);
		map.put("password", password);
		
		int cnt = sst.insert("member.add", map);

	}
	
	//로그인
	public MemberVO checkSignIn(String email, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		
		MemberVO vo = sst.selectOne("member.signInChk", map);
		
		return vo;
	}
}
