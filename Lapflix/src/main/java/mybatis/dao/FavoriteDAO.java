package mybatis.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int addFavorite(String f_key, String laptop_seq) {
		
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("f_key", f_key);
		map.put("laptop_seq", laptop_seq);
		
		int cnt = sst.insert("member.add_f_key", map);
		
		return cnt;
	}
	
	public List<String> getFavorite(String f_key) {
		 List<String> f_list = sst.selectList("member.get_f_key", f_key);
		 return f_list;
	}
	
}
