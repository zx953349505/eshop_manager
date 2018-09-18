package eshop_manager.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.PvBiz;
import eshop_manager.dao.PvMapper;


public class PvBizImpl implements PvBiz {
	@Autowired
	private PvMapper pvMapper;

	public int selectPvCount() {
		// TODO Auto-generated method stub
		return pvMapper.selectPvCount();
	}

}
