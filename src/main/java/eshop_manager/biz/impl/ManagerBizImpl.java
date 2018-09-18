package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.ManagerBiz;
import eshop_manager.dao.ManagerMapper;
import eshop_manager.entity.ManagerInfo;

public class ManagerBizImpl implements ManagerBiz {
	@Autowired
	private ManagerMapper managerMapper;
	@Override
	public List<ManagerInfo> selectManList() {
		// TODO Auto-generated method stub
		return managerMapper.selectManList();
	}

	@Override
	public void addMan(ManagerInfo managerInfo) {
		// TODO Auto-generated method stub
		managerMapper.addMan(managerInfo);
	}

	@Override
	public void deleteMan(int manager_id) {
		// TODO Auto-generated method stub
		managerMapper.deleteMan(manager_id);
	}

	@Override
	public ManagerInfo selectManByMsg(ManagerInfo managerInfo) {
		// TODO Auto-generated method stub
		return managerMapper.selectManByMsg(managerInfo);
	}

	@Override
	public ManagerInfo selectManById(int manager_id) {
		// TODO Auto-generated method stub
		return managerMapper.selectManById(manager_id);
	}

}
