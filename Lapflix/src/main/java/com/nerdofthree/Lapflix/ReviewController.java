package com.nerdofthree.Lapflix;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
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
		if(cPage != null && cPage.length() > 0) {
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
		
		mv.setViewName("review/reviewList");
		
		return mv;
	}
	
	//write
	@RequestMapping("/write")
	@ResponseBody
	public Map<String, String> write(){
		Map<String, String> map = new Hashtable<String, String>();
		
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
			viewPath = "review/reviewWrite";
		}else {
			viewPath = "sign_in";
		}
		return viewPath;
		
	}
	
	//write_ok
	@RequestMapping("/write_ok")
	public ModelAndView writeOk(ReviewVO rvo) throws Exception{
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
	
	//summernote 이미지 삽입
	@RequestMapping("/saveImage")
	@ResponseBody
	public Map<String, String> saveImage(ReviewVO rvo, HttpServletRequest req) throws Exception{
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
			
			map.put("img_url", req.getContextPath()+"/upload/"+f_name);
		}
		return map;
	}
	
	//view
	@RequestMapping("/view")
	public ModelAndView view(String cPage, String r_idx) {
		
		Object obj = session.getAttribute("view_list");
		List<ReviewVO> v_list = null;
		
		if(obj == null) {
			v_list = new ArrayList<ReviewVO>();
			
			session.setAttribute("view_list", v_list);
		}else {
			v_list = (List<ReviewVO>) obj;
		}
		
		boolean chk = false;
		for(ReviewVO rvo : v_list) {
			if(rvo.getR_idx().equals(r_idx)) {
				chk = true;
				break;
			}
		}
		
		ReviewVO rvo = r_dao.getReview(r_idx);
		
		if(!chk) {
			r_dao.updateHit(r_idx);
			rvo.setHit(String.valueOf(Integer.parseInt(rvo.getHit())+1));
			
			v_list.add(rvo);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", rvo);
		
		session.setAttribute("rvo", rvo);
		
		mv.setViewName("review/reviewView");
		return mv;
	}
	
	//edit
	@RequestMapping("/edit")
	public ModelAndView edit(ReviewVO rvo) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String c_type = request.getContentType();
		
		if(c_type != null && c_type.startsWith("multipart")) {
			
			MultipartFile mf = rvo.getFile();
			
			if(mf != null && mf.getSize() > 0) {
				String path = application.getRealPath(uploadPath);
				
				String f_name = mf.getOriginalFilename();
				
				f_name = FileUploadUtil.checkSameFileName(f_name, path);
				
				mf.transferTo(new File(path, f_name));
				
				rvo.setFile_name(f_name);
			}
			
			rvo.setIp(request.getRemoteAddr());
			r_dao.editReview(rvo);
			
			mv.setViewName("redirect:/view?r_idx="+rvo.getR_idx()+"&cPage="+rvo.getcPage());
		}else {
			mv.setViewName("review/reviewEdit");
		}
		
		return mv;
	}
	
	//delete
	@RequestMapping("/del")
	@ResponseBody
	public Map<String, String> del(String r_idx){
		Map<String, String> map = new HashMap<String, String>();
		
		r_dao.delReview(r_idx);
		
		map.put("chk", "0");
		
		return map;
	}
}
