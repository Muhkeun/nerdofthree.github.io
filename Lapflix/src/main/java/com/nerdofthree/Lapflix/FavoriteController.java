package com.nerdofthree.Lapflix;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.FavoriteDAO;
import mybatis.vo.FavoriteVO;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteDAO f_dao;

	@RequestMapping("/favorite")
	@ResponseBody
	public Map<String, String> favorite(FavoriteVO fvo) {
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println(fvo.getF_key()+"/"+fvo.getLaptop_seq());
		
		FavoriteVO f = f_dao.getFavorite(fvo.getF_key(), fvo.getLaptop_seq());
		
		if(f == null) {
			int cnt = f_dao.addFavorite(fvo.getF_key(), fvo.getLaptop_seq());
			if(cnt>0)
				map.put("f_chk", "1");
		}else {
			int cnt = f_dao.delFavorite(fvo.getF_key(), fvo.getLaptop_seq());
			if(cnt>0)
				map.put("f_chk", "0");
		}
		
		return map;
	}
}
