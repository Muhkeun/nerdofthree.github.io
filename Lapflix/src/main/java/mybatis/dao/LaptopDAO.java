package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.Cpu_BenchVO;
import mybatis.vo.Gpu_BenchVO;
import mybatis.vo.LaptopVO;
import mybatis.vo.Program_BenchVO;

@Component
public class LaptopDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<LaptopVO> getLaptopList(LaptopVO lvo){
		
		System.out.println(lvo.getLaptop_weight());
		List<LaptopVO> list = sst.selectList("laptop.list", lvo);	
		
		return list;		
	}
	
	
	public Program_BenchVO getPoint(String program_Name){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("program_Name", program_Name);
		
		Program_BenchVO pbvo = sst.selectOne("laptop.program", map);
		
		return pbvo;
	}
	
	
}
