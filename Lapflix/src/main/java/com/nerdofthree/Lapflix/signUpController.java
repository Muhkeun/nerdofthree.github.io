package com.nerdofthree.Lapflix;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;
import util.FileUploadUtil;

@Controller
public class signUpController {
	
	//업로드파일 위치
    private String uploadPath = "/resources/upload";
    
    @Autowired
    ServletContext application;
    
	@Autowired
	private MemberDAO m_dao;
	
	@RequestMapping("/signUp")
    public String signUp(){
    	
        return "sign_up";
    }
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public ModelAndView signUp_ok(MemberVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			
			String path = application.getRealPath(uploadPath);
			
			String profileImage = mf.getOriginalFilename();
			
			
			profileImage = FileUploadUtil.checkSameFileName(profileImage, path);
			mf.transferTo(new File(path, profileImage));
			
			vo.setProfile_image(profileImage);
		}
		m_dao.add(vo.getMember_name(), vo.getMember_age(), vo.getMember_gender(), vo.getEmail(), vo.getProfile_image() , vo.getPassword());
		mv.setViewName("sign_in");
		
		return mv;
	}
	
}
