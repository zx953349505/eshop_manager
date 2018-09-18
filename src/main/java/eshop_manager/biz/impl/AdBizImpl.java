package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.AdBiz;
import eshop_manager.dao.AdMapper;
import eshop_manager.entity.AdInfo;

public class AdBizImpl implements AdBiz {
	@Autowired
	private AdMapper adMapper;
	public List<AdInfo> selectAdInfo() {
		// TODO Auto-generated method stub
		return adMapper.selectAdInfo();
	}
	public void deleteAdByName(String ad_name) {
		// TODO Auto-generated method stub
		adMapper.deleteAdByName(ad_name);
	}
	public void addAdvertise(AdInfo adInfo) {
		// TODO Auto-generated method stub
		adMapper.addAdvertise(adInfo);
	}

}
