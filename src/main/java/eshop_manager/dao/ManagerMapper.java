package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.ManagerInfo;

public interface ManagerMapper {
	/**
	 * ��ѯ�û��б�
	 * @return
	 */
	List<ManagerInfo> selectManList();
	/**
	 * ����û�
	 * @param permissionInfo
	 */
	void addMan(ManagerInfo managerInfo);
	/**
	 * ɾ���û�
	 * @param permission_id
	 */
	void deleteMan(int manager_id);
	/**
	 * ����������ѯ����Ա
	 * @param managerInfo
	 * @return
	 */
	ManagerInfo selectManByMsg(ManagerInfo managerInfo);
	/**
	 * ����������ѯ����Ա
	 * @param managerInfo
	 * @return
	 */
	ManagerInfo selectManById(int manager_id);
}
