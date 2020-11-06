package com.nerdofthree.Lapflix;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.FavoriteDAO;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteDAO f_dao;

	@RequestMapping("/favorite")
	public String favorite(String f_Key, String laptop_Name) {

		f_dao.addFavorite(f_Key, laptop_Name);

		return "result";
	}
}
