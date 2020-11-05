package com.nerdofthree.Lapflix;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.LaptopDAO;
import mybatis.vo.LaptopVO;

@Controller
public class resultController {
	
	@Autowired
	private LaptopDAO l_dao;
	
    @RequestMapping("/result")
    public ModelAndView result(String laptop_MonitorSize, String laptop_OS, String program_Name){
    	
    	List<LaptopVO> lvo = l_dao.getlist(laptop_MonitorSize, laptop_OS, program_Name);
    	
    	ModelAndView mv = new ModelAndView();
    	
    	mv.addObject("lvo", lvo);
    	
    	mv.setViewName("result?m_size="+laptop_MonitorSize+"&l_OS="+laptop_OS+"&p_name="+program_Name);
    	
    	return mv;
    	
    	
    }
}
