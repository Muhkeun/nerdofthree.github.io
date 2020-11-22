package mybatis.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.FavoriteVO;
import mybatis.vo.LaptopVO;

@Component
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int addFavorite(String f_key, String laptop_seq) {
		
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("f_key", f_key);
		map.put("laptop_seq", laptop_seq);
		
		int cnt = sst.insert("member.addFavorite", map);
		
		return cnt;
	}
	
	public FavoriteVO getFavorite(String f_key, String laptop_seq) {
		 Map<String, String> map = new Hashtable<String, String>();
		 
		 map.put("f_key", f_key);
		 map.put("laptop_seq", laptop_seq);
		 
		 FavoriteVO fvo = sst.selectOne("member.getFavorite", map);
		 
		 return fvo;
	}
	
	public int delFavorite(String f_key, String laptop_seq) {
		Map<String, String> map = new Hashtable<String, String>();
		
		map.put("f_key", f_key);
		map.put("laptop_seq", laptop_seq);
		
		int cnt = sst.delete("member.delFavorite", map);
		
		return cnt;
	}
	
	public List<LaptopVO> getFavoriteList(String f_key) {
		
		List<LaptopVO> list = sst.selectList("laptop.f_list", f_key);
		
		return list;
	}
	
}
