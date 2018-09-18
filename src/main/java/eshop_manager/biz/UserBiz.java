package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.UserInfo;


public interface UserBiz {
	/**
	 * 查询用户总数
	 * @return
	 */
	int selectUserCount();
	/**
	 * 查询在线用户
	 * @return
	 */
	int selectOnlineUser();
	/**
	 * 查询用户列表
	 * @return
	 */
	List<UserInfo> selectUserList();
	
	/**
	 * 查询所有用户列表
	 * @return
	 */
	List<UserInfo> selectAllUserList(String keyWord, String regDate,Integer isActivated, 
			int currentPage,int pageSize);
	
	/**
	 * 所有所有用户数
	 * @return
	 */
	int  totalUserInfoCount(String keyWord, String regDate,Integer isActivated);
	
	/**
	 * 添加用户
	 * @return
	 */
	void  addUser(UserInfo userInfo);
	
}
