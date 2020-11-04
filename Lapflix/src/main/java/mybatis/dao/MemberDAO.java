package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//회원가입
	public boolean add(String name, int age, String gender, int f_key, String email, String profile_image ) {
		
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("member_name", name);
		map.put("member_age", name);
		map.put("member_gender", name);
		map.put("f_key", String.valueOf(f_key));
		map.put("email", email);
		map.put("profile_image", profile_image);
		
		return chk;
	}
}
