package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mybatis.dao.MemberDAO;

@Controller
public class signUpController {
    
	@Autowired
	private MemberDAO m_dao;
	
	@RequestMapping("/signUp")
    public String signUp(){
    	
        return "sign_up";
    }
	
	@RequestMapping(value = "/singUp", method = RequestMethod.POST)
	public String signUp_ok(String name, String age, String gender, String f_key, String email, String p_image) {
		
		m_dao.add(name, age, gender, f_key, email, p_image);
		
		return "sign_in";
	}
}
