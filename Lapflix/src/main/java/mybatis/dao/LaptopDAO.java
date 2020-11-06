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
	
	public List<LaptopVO> getLaptopList(String laptop_OS, String laptop_MonitorSize, String cpu_Name,
									String gpu_Name){
		Map<String, String> map = new HashMap<String, String>();
		
		
		map.put("laptop_MonitorSize", laptop_MonitorSize);
		map.put("laptop_OS", laptop_OS);
		map.put("cpu_Name", cpu_Name);
		map.put("gpu_Name", gpu_Name);
		
		List<LaptopVO> list = sst.selectList("laptop.list", map);
		
		return list;
		
	}
	
	public List<Cpu_BenchVO> getCpuList(int cpu_Point){
		
		Cpu_BenchVO cvo = new Cpu_BenchVO();
		cvo.setCpu_Point(cpu_Point);
		
		List<Cpu_BenchVO> cbvo = sst.selectList("laptop.cpuList", cvo);
		
		return cbvo;
	}
	
	public List<Gpu_BenchVO> getGpuList(int gpu_Point){
		
		Gpu_BenchVO gvo = new Gpu_BenchVO();
		gvo.setGpu_Point(gpu_Point);
		
		List<Gpu_BenchVO> gbvo = sst.selectList("laptop.gpuList", gvo);
		
		return gbvo;
	}
	
	public Program_BenchVO getPoint(String program_Name){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("program_Name", program_Name);
		
		Program_BenchVO pbvo = sst.selectOne("laptop.program", map);
		
		return pbvo;
	}
	
	
}
