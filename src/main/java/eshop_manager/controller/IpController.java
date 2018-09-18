package eshop_manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eshop_manager.biz.IpBiz;
import eshop_manager.entity.IpInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/ip")
public class IpController {
	@Autowired
	private IpBiz ipBiz;
	
	@RequestMapping("/selectIpList")
	@CheckLoginRequired
	public @ResponseBody List<IpInfo> selectIpList() throws Exception{
		List<IpInfo> ipList=ipBiz.selectIpInfo();
		return ipList;
	}
}
