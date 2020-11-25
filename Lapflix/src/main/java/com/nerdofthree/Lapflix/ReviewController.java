package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.ReviewDAO;
import mybatis.vo.ReviewVO;
import review.util.Paging;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDAO r_dao;
	
	private int blockList = 10; //한 페이지에 보여질 게시물 수
	private int blockPage = 5; //한 블럭당 보여질 페이지 수
	
	@RequestMapping("/review")
	public ModelAndView reviewList(String laptop_seq, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int c_page = 1;
		if(cPage != null) {
			c_page = Integer.parseInt(cPage);
		}
		
		int rowTotal = r_dao.totalCount(laptop_seq);
		
		Paging page = new Paging(c_page, rowTotal, blockList, blockPage, laptop_seq);
		
		//목록을 얻어낸다.
		ReviewVO[] rar = r_dao.getList(page.getBegin(), page.getEnd(), laptop_seq);
		
		mv.addObject("rar", rar);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("nowPage", c_page);
		mv.addObject("blockList", blockList);
		mv.addObject("p_code", page.getSb().toString());
		
		mv.setViewName("review/list");
		
		return mv;
	}
}
