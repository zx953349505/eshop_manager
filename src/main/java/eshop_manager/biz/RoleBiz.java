package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.RoleInfo;

public interface RoleBiz {
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
	void addRole(String role_name,List<Integer> perList);
}
