package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class KaKaoController {

    @RequestMapping("/kakao_sign")
    public ModelAndView kakaoSignUp(String code){
        //카카오서버에서 인증코드를 전달 해주는 곳
        ModelAndView modelAndView = new ModelAndView();

        System.out.println("CODE: "+ code);

        return modelAndView;
    }
}
