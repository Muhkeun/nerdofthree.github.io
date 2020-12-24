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
		LaptopVO[] ar = null;
		@Autowired
		private LaptopDAO l_dao;
		
		@RequestMapping("result")
		public ModelAndView result(SurveyVO svo, String search) {
			
			ModelAndView mv = new ModelAndView();
			
			if(search == null) {
			
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
				
				if(svo.getLaptop_MonitorSize().equals(""))
					lvo.setLaptop_MonitorSize(null);
				else
					lvo.setLaptop_MonitorSize(svo.getLaptop_MonitorSize());
				
				lvo.setLaptop_OS(svo.getLaptop_OS());
				lvo.setLaptop_Weight(Float.parseFloat(svo.getLaptop_Weight()));
				lvo.setLaptop_Price(Integer.parseInt(svo.getLaptop_Price()));
				
				List<LaptopVO> l_list = l_dao.getLaptopList(lvo);
				
				//리스트를 배열로 변환
				if(l_list != null && l_list.size() > 0) {
					ar = new LaptopVO[l_list.size()];
					
					l_list.toArray(ar);
				}
				
				mv.addObject("ar", ar);		
				
			}else{ //전체 데이터 받아와서 검색으로 수정
				search = search.toLowerCase();
				List<LaptopVO> l_list = l_dao.getAllLaptopList();
					
				//리스트를 배열로 변환
				if(l_list != null && l_list.size() > 0) {
					ar = new LaptopVO[l_list.size()];
					
					l_list.toArray(ar);
				}
				
				int cnt = 0;
				for(LaptopVO sar : ar) {
					int isSearched = sar.getLaptop_Name().toLowerCase().indexOf(search);
					if(isSearched != -1) {//검색됐다
						cnt += 1;
					}
				}
			
		
				LaptopVO[] search_ar = new LaptopVO[cnt];
				cnt = 0;
				for(int i=0; i<ar.length; i++) {
					int isSearched = ar[i].getLaptop_Name().toLowerCase().indexOf(search);
					if(isSearched != -1) {//검색됐다
						search_ar[cnt] = ar[i];
						cnt += 1;
					}
				}

		
				mv.addObject("ar", search_ar);		
			
			}

			mv.setViewName("result");			
			
			return mv;
		}
}