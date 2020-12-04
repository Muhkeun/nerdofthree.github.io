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
import mybatis.vo.SurveyVO;

@Controller
public class ResultController {
		
		@Autowired
		private LaptopDAO l_dao;
		
		@Autowired
		private HttpSession httpSession;
		
		@RequestMapping("result")
		public ModelAndView result(SurveyVO svo) {
			
			ModelAndView mv = new ModelAndView();
			
			//설문값 세션에 저장
			httpSession.setAttribute("svo", svo);
			
			//프로그램 최저/권장 밴치점수 구하기
			Program_BenchVO point = l_dao.getPoint(svo.getProgram_Name());
			int cpu_Point = -1;
			int gpu_Point = -1;
			if(svo.getStatus().equals("noob") || svo.getStatus().equals("")) {
				cpu_Point = point.getProgram_Cpu_min();
				gpu_Point = point.getProgram_Gpu_min();
			}else if(svo.getStatus().equals("expert")) {
				cpu_Point = point.getProgram_Cpu_rec();
				gpu_Point = point.getProgram_Gpu_rec();
			}
			
			LaptopVO lvo = new LaptopVO();

			//파라미터값들 LaptopVO에 넣기
			lvo.setCpu_Point(cpu_Point);
			lvo.setGpu_Point(gpu_Point);
			
			if(svo.getLaptop_MonitorSize().equals("")) {
				lvo.setLaptop_MonitorSize(null);
			}else {
				lvo.setLaptop_MonitorSize(svo.getLaptop_MonitorSize());
			}
			lvo.setLaptop_OS(svo.getLaptop_OS());
			lvo.setLaptop_Weight(Float.parseFloat(svo.getLaptop_Weight()));
			lvo.setLaptop_Price(Integer.parseInt(svo.getLaptop_Price()));
			
			List<LaptopVO> l_list = l_dao.getLaptopList(lvo);
			
			//리스트를 배열로 변환
			LaptopVO[] ar = null;
			
			if(l_list != null && l_list.size() > 0) {
				ar = new LaptopVO[l_list.size()];
				
				l_list.toArray(ar);
			}
			
			mv.addObject("ar", ar);		
			
			mv.setViewName("result");			
			
			return mv;
		}
}