package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;

public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//회원가입
	public void add(String name, String age, String gender, String f_key, String email, String p_image ) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("age", age);
		map.put("gender", gender);
		map.put("f_key", f_key);
		map.put("email", email);
		map.put("p_image", p_image);
		
		int cnt = sst.insert("member.add", map);

	}
	
	//로그인
	public MemberVO checkSignIn(String email) {
		MemberVO vo = sst.selectOne("member.signInChk");
		
		return vo;
	}
}
