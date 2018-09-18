package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.UserInfo;


public interface UserBiz {
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
	List<UserInfo> selectAllUserList(String keyWord, String regDate,Integer isActivated, 
			int currentPage,int pageSize);
	
	/**
	 * ���������û���
	 * @return
	 */
	int  totalUserInfoCount(String keyWord, String regDate,Integer isActivated);
	
	/**
	 * �����û�
	 * @return
	 */
	void  addUser(UserInfo userInfo);
	
}