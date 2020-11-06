package com.nerdofthree.Lapflix;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LaptopDAO;
import mybatis.vo.Cpu_BenchVO;
import mybatis.vo.Gpu_BenchVO;
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
			int cpu_point = point.getProgram_Cpu_min();
			int gpu_point = point.getProgram_Gpu_min();
			
			//cpu, gpu 이름 리스트 얻기
			List<Cpu_BenchVO> c_list = l_dao.getCpuList(cpu_point);
			List<Gpu_BenchVO> g_list = l_dao.getGpuList(gpu_point);
			
			String cpu_Name = null;
			String gpu_Name = null;
			
			for(Cpu_BenchVO cvo : c_list) {
				cpu_Name = cvo.getCpu_Name();
			}
			for(Gpu_BenchVO gvo : g_list) {
				gpu_Name = gvo.getGpu_Name();
			}
			List<LaptopVO> l_list = l_dao.getLaptopList(laptop_OS, laptop_MonitorSize, cpu_Name, gpu_Name);
			
			LaptopVO[] ar = null;
			if(l_list != null && l_list.size() > 0) {
				ar = new LaptopVO[l_list.size()];
				
				l_list.toArray(ar);
			}
			
			System.out.println(l_list.size());
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("ar", ar);
			mv.setViewName("result");
					
			return mv;
		}
}

