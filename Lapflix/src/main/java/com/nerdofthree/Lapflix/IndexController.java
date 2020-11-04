package com.nerdofthree.Lapflix;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/sign_in")
    public String signIn(){
        return "sign_in";
    }

}

