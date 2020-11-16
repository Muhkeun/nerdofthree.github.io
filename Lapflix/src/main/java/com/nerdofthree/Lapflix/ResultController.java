package com.nerdofthree.Lapflix;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LaptopDAO;
import mybatis.vo.LaptopVO;
import mybatis.vo.Program_BenchVO;

@Controller
public class ResultController {
		
		@Autowired
		private LaptopDAO l_dao;
		
		@Autowired
		private HttpSession httpSession;
		
		@RequestMapping("result")
		public ModelAndView result(String laptop_MonitorSize, String program_Name, String laptop_OS, String status, String laptop_Weight, String laptop_Price) {
			
			httpSession.setAttribute("laptop_MonitorSize", laptop_MonitorSize);
			httpSession.setAttribute("program_Name", program_Name);
			httpSession.setAttribute("laptop_OS", laptop_OS);
			httpSession.setAttribute("laptop_Weight", laptop_Weight);
			httpSession.setAttribute("status", status);
			httpSession.setAttribute("laptop_Price", laptop_Price);
			
			//프로그램 점수 구하기
			Program_BenchVO point = l_dao.getPoint(program_Name);
			int cpu_Point = -1;
			int gpu_Point = -1;
			if(status.equals("noob") || status.equals("")) {
				cpu_Point = point.getProgram_Cpu_min();
				gpu_Point = point.getProgram_Gpu_min();
			}else if(status.equals("expert")) {
				cpu_Point = point.getProgram_Cpu_rec();
				gpu_Point = point.getProgram_Gpu_rec();
			}
			
			LaptopVO lvo = new LaptopVO();

			//파라미터값들 LaptopVO에 넣기
			lvo.setCpu_Point(cpu_Point);
			lvo.setGpu_Point(gpu_Point);
			
			if(laptop_MonitorSize.equals(""))
				lvo.setLaptop_MonitorSize(null);
			else
				lvo.setLaptop_MonitorSize(laptop_MonitorSize);
			
			lvo.setLaptop_OS(laptop_OS);
			lvo.setLaptop_Weight(Float.parseFloat(laptop_Weight));
			lvo.setLaptop_Price(Integer.parseInt(laptop_Price));
			
			
			List<LaptopVO> l_list = l_dao.getLaptopList(lvo);
			
			LaptopVO[] ar = null;
			if(l_list != null && l_list.size() > 0) {
				ar = new LaptopVO[l_list.size()];
				
				l_list.toArray(ar);
			}
			
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("ar", ar);		
			
			mv.setViewName("result");
			
			return mv;
		}
}

