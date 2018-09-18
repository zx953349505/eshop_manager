package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.ManagerInfo;

public interface ManagerMapper {
	/**
	 * 查询用户列表
	 * @return
	 */
	List<ManagerInfo> selectManList();
	/**
	 * 添加用户
	 * @param permissionInfo
	 */
	void addMan(ManagerInfo managerInfo);
	/**
	 * 删除用户
	 * @param permission_id
	 */
	void deleteMan(int manager_id);
	/**
	 * 根据条件查询管理员
	 * @param managerInfo
	 * @return
	 */
	ManagerInfo selectManByMsg(ManagerInfo managerInfo);
	/**
	 * 根据条件查询管理员
	 * @param managerInfo
	 * @return
	 */
	ManagerInfo selectManById(int manager_id);
}
