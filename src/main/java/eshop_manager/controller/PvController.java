package eshop_manager.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eshop_manager.biz.PvBiz;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/pv")
public class PvController {
	@Autowired
	private PvBiz pvBiz;
	
	@RequestMapping("/selectPvCount")
	@CheckLoginRequired
	public @ResponseBody int selectPvCount() throws Exception{
		int count=pvBiz.selectPvCount();
		return count;
	}
}
