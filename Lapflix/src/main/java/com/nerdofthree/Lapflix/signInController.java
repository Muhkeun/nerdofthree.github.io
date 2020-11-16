package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Controller
public class signInController {
	
	@Autowired
	private MemberDAO m_dao;
	
    @Autowired
    private HttpSession httpSession;

    @RequestMapping("/signIn")
    public String signIn(){
    	return "sign_in";
    }
    
    @RequestMapping(value="/signIn", method = RequestMethod.POST)
    public String signIn_ok(MemberVO vo) {
    	ModelAndView mv = new ModelAndView();
    	MemberVO mvo = m_dao.checkSignIn(vo.getEmail(), vo.getPassword()); //selectOne return null
    	if(mvo != null) {
    		System.out.println("로그인 성공");
    		httpSession.setAttribute("mvo", mvo);
    		String laptop_MonitorSize = (String) httpSession.getAttribute("laptop_MonitorSize");
    		String program_Name = (String) httpSession.getAttribute("program_Name");
    		String laptop_OS = (String) httpSession.getAttribute("laptop_OS");
    		String laptop_Weight = (String) httpSession.getAttribute("laptop_Weight");
    		String status  = (String) httpSession.getAttribute("status");
    		String laptop_Price = (String) httpSession.getAttribute("laptop_Price");
    		
    		//mv.setViewName("redirect:result?laptop_MonitorSize="+laptop_MonitorSize+"&program_Name="+
    		//				program_Name+"&laptop_OS="+laptop_OS+"&laptop_Weight="+laptop_Weight+"&status="+status+"&laptop_Price="+laptop_Price);
    	}else {
    		System.out.println("로그인 실패");
    		mv.setViewName("sign_in");
    	}
    	
    	return "forward:/result";
    }

}
