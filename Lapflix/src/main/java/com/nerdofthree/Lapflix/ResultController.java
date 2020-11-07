package com.nerdofthree.Lapflix;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LaptopDAO;
import mybatis.vo.Cpu_BenchVO;
import mybatis.vo.Gpu_BenchVO;
import mybatis.vo.LaptopParamVO;
import mybatis.vo.LaptopVO;
import mybatis.vo.Program_BenchVO;

@Controller
public class ResultController {
		
		@Autowired
		private LaptopDAO l_dao;
		
		@RequestMapping("/result")
		public ModelAndView result(String laptop_MonitorSize, String program_Name, String laptop_OS) {
			
			//프로그램 최저사양 점수 구하기
			Program_BenchVO point = l_dao.getPoint(program_Name);
			int cpu_Point = point.getProgram_Cpu_min();
			int gpu_Point = point.getProgram_Gpu_min();
			
			LaptopParamVO lpvo = new LaptopParamVO();
			
			//파라미터값들 LaptopParamVO에 넣기
			lpvo.setCpu_Point(cpu_Point);
			lpvo.setGpu_Point(gpu_Point);
			lpvo.setLaptop_MonitorSize(laptop_MonitorSize);
			lpvo.setLaptop_OS(laptop_OS);
			
			List<LaptopVO> l_list = l_dao.getLaptopList(lpvo);
			
			LaptopVO[] ar = null;
			if(l_list != null && l_list.size() > 0) {
				ar = new LaptopVO[l_list.size()];
				
				l_list.toArray(ar);
			}
			
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("ar", ar);
			mv.setViewName("result");
			
			if(ar == null) {
				System.out.println("nope");
			}
					
			return mv;
		}
}

