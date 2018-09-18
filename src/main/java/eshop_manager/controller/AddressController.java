package eshop_manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eshop_manager.biz.AddressBiz;
import eshop_manager.entity.AddressInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private AddressBiz addressBiz;

	@RequestMapping("/province")
	@CheckLoginRequired
	public @ResponseBody List<AddressInfo> province()
			throws Exception{
		
		List<AddressInfo> provinceList = addressBiz.provinceList();

		return provinceList;
	}
	
	@RequestMapping("/city")
	@CheckLoginRequired
	public @ResponseBody List<AddressInfo> city(HttpServletRequest request)
			throws Exception{
		
		String province_id=request.getParameter("province_id");
		List<AddressInfo> cityList = addressBiz.cityList(province_id);
		
		return cityList;
	}
	
	@RequestMapping("/area")
	@CheckLoginRequired
	public @ResponseBody List<AddressInfo> area(HttpServletRequest request)
			throws Exception{
		
		String city_id=request.getParameter("city_id");
		
		List<AddressInfo> areaList = addressBiz.areaList(city_id);
		
		return areaList;
	}

}
