package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.LaptopVO;
import mybatis.vo.MemberVO;
import mybatis.vo.SurveyVO;

import java.util.Hashtable;
import java.util.Map;

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
    @ResponseBody
    public Map<String, Object> signIn_ok(String email, String password) {
    	Map<String, Object> map = new Hashtable<String, Object>();
    	MemberVO mvo = m_dao.checkSignIn(email, password); //selectOne return null
    	
    	if(mvo != null) {
    		System.out.println("로그인 성공");
    		httpSession.setAttribute("mvo", mvo);
    		
    		map.put("res", "1");
    		map.put("mvo", mvo);

    	}else {
    		System.out.println("로그인 실패");
    		map.put("res", "0");
    	}
    	
    	return map;
    }
    
    @RequestMapping("/signOut")
    @ResponseBody
    public Map<String, Object> signOut() {
    	
    	httpSession.removeAttribute("mvo");
    	
    	Map<String, Object> map = new Hashtable<String, Object>();
    	map.put("res", "0");
    	
    	return map;
    }

}
