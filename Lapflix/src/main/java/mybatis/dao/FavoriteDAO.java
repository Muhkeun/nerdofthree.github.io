package mybatis.dao;

import java.util.Hashtable;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public void addFavorite(String f_Key, String laptop_Name) {
		
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("f_Key", f_Key);
		map.put("laptop_Name", laptop_Name);
		
		sst.insert("member.add_f_Key", map);
		
	}
	
}
