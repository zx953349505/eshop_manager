package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.UserInfo;

public interface UserMapper {
	/**
	 * ��ѯ�û�����
	 * @return
	 */
	int selectUserCount();
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	int selectOnlineUser();
	/**
	 * ��ѯ�û��б�
	 * @return
	 */
	List<UserInfo> selectUserList();
	
	/**
	 * ��ѯ�����û��б�
	 * @return
	 */
	List<UserInfo> selectAllUserList(Map<String, Object> paramMap);
	
	/**
	 * ���������û���
	 * @return
	 */
	int  totalUserInfoCount(Map<String, Object> paramMap);
	
	/**
	 * ����û�
	 * @return
	 */
	void  addUser(UserInfo userInfo);
	
}
