package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Controller
public class signInController {

    @Autowired
    private HttpSession httpSession;

    @RequestMapping("signIn")
    public String signIn(String Email,String Age, String Gender){

        System.out.println(Email + Age + Gender);

        return "sign_in";
    }

}
