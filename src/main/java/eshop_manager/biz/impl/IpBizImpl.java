package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.IpBiz;
import eshop_manager.dao.IpMapper;
import eshop_manager.entity.IpInfo;


public class IpBizImpl implements IpBiz{
	@Autowired
	private IpMapper ipMapper;

	public List<IpInfo> selectIpInfo() {
		// TODO Auto-generated method stub
		return ipMapper.selectIpInfo();
	}

}
