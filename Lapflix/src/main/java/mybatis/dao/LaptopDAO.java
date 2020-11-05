package mybatis.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.LaptopVO;

public class LaptopDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	public List<LaptopVO> getlist(String laptop_MonitorSize, String laptop_OS, String program_Name) {
		
		Map<String, String> map = new Hashtable<String, String>();
		
		List<LaptopVO> list = sst.selectList("laptop.list", map);
		return null;
	}
	
}
