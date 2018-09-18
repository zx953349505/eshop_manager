package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.AddressBiz;
import eshop_manager.dao.AddressMapper;
import eshop_manager.entity.AddressInfo;


public class AddressBizImpl implements AddressBiz {
	@Autowired
	AddressMapper addressMapper;
	
	public List<AddressInfo> provinceList() {
		
		return addressMapper.selectProvinceList();
	}

	public List<AddressInfo> cityList(String provinceid) {
		
		return addressMapper.selectCityList(provinceid);
	}

	public List<AddressInfo> areaList(String cityid) {
		
		return addressMapper.selectAreaList(cityid);
	}

}
