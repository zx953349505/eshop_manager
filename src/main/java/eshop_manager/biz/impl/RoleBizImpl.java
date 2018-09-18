package eshop_manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import eshop_manager.biz.RoleBiz;
import eshop_manager.dao.RoleMapper;
import eshop_manager.entity.RoleInfo;
@Transactional
public class RoleBizImpl implements RoleBiz {
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<RoleInfo> selectRoleList() {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleList();
	}

	@Override
	public void deleteRole(int role_id) {
		// TODO Auto-generated method stub
		roleMapper.deleteRole(role_id);
	}

	@Override
	public void addRole(String role_name,List<Integer> perList) {
		// TODO Auto-generated method stub
		RoleInfo roleInfo=new RoleInfo();
		roleInfo.setRole_name(role_name);
		int role_id=roleMapper.addRole(roleInfo);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("perList", perList);
		roleMapper.addRolePermission(map);
	}

}
