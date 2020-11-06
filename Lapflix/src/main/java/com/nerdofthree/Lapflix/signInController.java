package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    
    public ModelAndView signIn_ok(MemberVO vo) {
    	ModelAndView mv = new ModelAndView();
    	
    	MemberVO mvo = m_dao.checkSignIn(vo.getEmail()); //selectOne return null
    	if(mvo != null) {
    		httpSession.setAttribute("mvo", mvo);
    		mv.setViewName("result");
    	}else {
    		mv.setViewName("sign_in");
    	}
    	
    	return mv;
    }

}
