package com.nerdofthree.Lapflix;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.FavoriteDAO;
import mybatis.vo.FavoriteVO;
import mybatis.vo.LaptopVO;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteDAO f_dao;
	
	@Autowired
	private HttpSession httpSession;

	@RequestMapping("/favorite")
	@ResponseBody
	public Map<String, String> favorite(FavoriteVO fvo) {
		Map<String, String> map = new Hashtable<String, String>();
		
		String key = fvo.getF_key();
		String seq = fvo.getLaptop_seq();
		
		System.out.println(key+"/"+seq);
		
		FavoriteVO f = f_dao.getFavorite(key, seq);
		
		if(f == null) {
			int cnt = f_dao.addFavorite(key, seq);
			if(cnt > 0)
				map.put("f_chk", "1");
		}else {
			int cnt = f_dao.delFavorite(key, seq);
			if(cnt > 0)
				map.put("f_chk", "0");
		}
		
		return map;
	}
	
	@RequestMapping("/getFavoriteList")
	@ResponseBody
	public void getFavoriteList(String f_key) {
		
		List<LaptopVO> f_list = f_dao.getFavoriteList(f_key);
				
		Map<String, Object> map = new Hashtable<String, Object>();
		
		//리스트를 배열로 변환
		LaptopVO[] far = null;
		if(f_list != null && f_list.size() > 0) {
			far = new LaptopVO[f_list.size()];
			f_list.toArray(far);
		}
		httpSession.setAttribute("far", far);
		
	}
	
	@RequestMapping("/favoriteList")
	public String foavoriteList() {
		return "favorite";
	}
}
