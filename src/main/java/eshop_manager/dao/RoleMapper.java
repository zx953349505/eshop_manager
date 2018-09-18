package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.RoleInfo;

public interface RoleMapper {
	/**
	 * ��ѯ��ɫ
	 * @return
	 */
	List<RoleInfo> selectRoleList();
	/**
	 * ɾ����ɫ
	 * @param role_id
	 */
	void deleteRole(int role_id);
	/**
	 * ��ӽ�ɫ
	 * @param role_name
	 */
	int addRole(RoleInfo roleInfo);
	/**
	 * ��ӽ�ɫȨ��
	 * @param map
	 */
	void addRolePermission(Map<String, Object> map);
}
