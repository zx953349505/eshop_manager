package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.PermissionInfo;

public interface PermissionMapper {
	/**
	 * ��ѯȨ���б�
	 * @return
	 */
	List<PermissionInfo> selectPerList();
	/**
	 * ���Ȩ��
	 * @param permissionInfo
	 */
	void addPer(String per_name);
	/**
	 * ɾ��Ȩ��
	 * @param permission_id
	 */
	void deletePer(int permission_id);
	/**
	 * ��ѯ�û�Ȩ��
	 * @param role_id
	 * @return
	 */
	List<Integer> selectRolePer(int role_id);
}
