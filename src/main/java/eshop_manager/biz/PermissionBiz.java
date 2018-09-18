package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.PermissionInfo;

public interface PermissionBiz {
	/**
	 * 查询权限列表
	 * @return
	 */
	List<PermissionInfo> selectPerList();
	/**
	 * 添加权限
	 * @param permissionInfo
	 */
	void addPer(String per_name);
	/**
	 * 删除权限
	 * @param permission_id
	 */
	void deletePer(int permission_id);
	/**
	 * 查询用户权限
	 * @param role_id
	 * @return
	 */
	List<Integer> selectRolePer(int role_id);
}
