package com.nerdofthree.Lapflix;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class signUpController {
    @RequestMapping("/signUp")
    public String signUp(){

        return "sign_up";
    }
}
