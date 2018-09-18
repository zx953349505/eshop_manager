package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.PermissionBiz;
import eshop_manager.dao.PermissionMapper;
import eshop_manager.entity.PermissionInfo;

public class PermissionBizImpl implements PermissionBiz{
	@Autowired
	private PermissionMapper perMapper;
	@Override
	public List<PermissionInfo> selectPerList() {
		// TODO Auto-generated method stub
		return perMapper.selectPerList();
	}

	@Override
	public void addPer(String per_name) {
		// TODO Auto-generated method stub
		perMapper.addPer(per_name);
	}

	@Override
	public void deletePer(int permission_id) {
		// TODO Auto-generated method stub
		perMapper.deletePer(permission_id);
	}

	@Override
	public List<Integer> selectRolePer(int role_id) {
		// TODO Auto-generated method stub
		return perMapper.selectRolePer(role_id);
	}

}
