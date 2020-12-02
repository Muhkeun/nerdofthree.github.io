package com.nerdofthree.Lapflix;

import java.io.File;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.ReviewDAO;
import mybatis.vo.MemberVO;
import mybatis.vo.ReviewVO;
import review.util.Paging;
import util.FileUploadUtil;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDAO r_dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	private int blockList = 10; //한 페이지에 보여질 게시물 수
	private int blockPage = 5; //한 블럭당 보여질 페이지 수
	
	private String uploadPath = "/resources/upload";
	
	//list
	@RequestMapping("/review")
	public ModelAndView reviewList(String bname, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int c_page = 1;
		if(cPage != null) {
			c_page = Integer.parseInt(cPage);
		}
		
		if(bname == null) {
			bname = "review";
		}
		int rowTotal = r_dao.totalCount(bname);
		
		Paging page = new Paging(c_page, rowTotal, blockList, blockPage);
		
		//목록을 얻어낸다.
		ReviewVO[] rar = r_dao.getList(page.getBegin(), page.getEnd(), bname);
		
		mv.addObject("rar", rar);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("nowPage", c_page);
		mv.addObject("blockList", blockList);
		mv.addObject("p_code", page.getSb().toString());
		
		mv.setViewName("review/list");
		
		return mv;
	}
	
	//write
	@RequestMapping("/write")
	@ResponseBody
	public Map<String, String> write(){
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		if(mvo != null) {
			map.put("chk", "1");
			map.put("url", "writeForm");
		}else {
			map.put("chk", "0");
			map.put("url", "writeForm");
		}
		
		return map;
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String viewPath = null;
		if(mvo != null) {
			viewPath = "review/write";
		}else {
			viewPath = "sign_in";
		}
		return viewPath;
		
	}
	
	@RequestMapping("/write_ok")
	public ModelAndView writOk(ReviewVO rvo) throws Exception{
		//write.jsp에서 전달되는 form의 값들(bname, subject, content, file_name, laptop_name)
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = rvo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			String path = application.getRealPath(uploadPath);
			
			String f_name = mf.getOriginalFilename();
			
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			mf.transferTo(new File(path, f_name));
			
			rvo.setFile_name(f_name);
		}
		
		rvo.setIp(request.getRemoteAddr());
		
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		rvo.setWriter(mvo.getMember_name());
		
		r_dao.add(rvo);
		mv.setViewName("redirect:/review");
		
		return mv;
	}
	
	@RequestMapping("/saveImage")
	@ResponseBody
	public Map<String, String> saveImage(ReviewVO rvo) throws Exception{
		Map<String, String> map = new Hashtable<String, String>();
		
		MultipartFile mf = rvo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			String path = application.getRealPath(uploadPath);
			
			//오리지널 파일명
			String f_name = mf.getOriginalFilename();
			
			//동일한 파일명이 있다면 변경
			f_name = FileUploadUtil.checkSameFileName(f_name,  path);
			
			//업로드
			File f = new File(path, f_name); 
			mf.transferTo(f);
			
			map.put("img_url", request.getContextPath()+"/upload/"+f_name);
		}
		return map;
	}
}
