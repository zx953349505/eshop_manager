package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.UserInfo;

public interface UserMapper {
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
	List<UserInfo> selectAllUserList(Map<String, Object> paramMap);
	
	/**
	 * 所有所有用户数
	 * @return
	 */
	int  totalUserInfoCount(Map<String, Object> paramMap);
	
	/**
	 * 添加用户
	 * @return
	 */
	void  addUser(UserInfo userInfo);
	
}
