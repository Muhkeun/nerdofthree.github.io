package com.nerdofthree.Lapflix;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.FavoriteDAO;
import mybatis.vo.FavoriteVO;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteDAO f_dao;

	@RequestMapping("/favorite")
	public Map<String, String> favorite(FavoriteVO fvo) {
		Map<String, String> map = new HashMap<String, String>();
		
		int cnt = f_dao.addFavorite(fvo.getF_Key(), fvo.getLaptop_seq());
		
		if(cnt > 0)
			map.put("val", "1");
		
		return map;		
	}
}
