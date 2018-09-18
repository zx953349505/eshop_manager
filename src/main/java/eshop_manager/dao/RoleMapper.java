package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.RoleInfo;

public interface RoleMapper {
	/**
	 * 查询角色
	 * @return
	 */
	List<RoleInfo> selectRoleList();
	/**
	 * 删除角色
	 * @param role_id
	 */
	void deleteRole(int role_id);
	/**
	 * 添加角色
	 * @param role_name
	 */
	int addRole(RoleInfo roleInfo);
	/**
	 * 添加角色权限
	 * @param map
	 */
	void addRolePermission(Map<String, Object> map);
}
