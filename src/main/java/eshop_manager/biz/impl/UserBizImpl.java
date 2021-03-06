package eshop_manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.UserBiz;
import eshop_manager.dao.UserMapper;
import eshop_manager.entity.UserInfo;


public class UserBizImpl implements UserBiz{
	@Autowired
	private UserMapper userDao;

	public int selectUserCount() {
		// TODO Auto-generated method stub
		return userDao.selectUserCount();
	}

	public int selectOnlineUser() {
		// TODO Auto-generated method stub
		return userDao.selectOnlineUser();
	}

	public List<UserInfo> selectUserList() {
		// TODO Auto-generated method stub
		return userDao.selectUserList();
	}

	public List<UserInfo> selectAllUserList(String keyWord, String regDate,Integer isActivated, 
			int currentPage,int pageSize) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("keyWord", keyWord);
		paramMap.put("regDate", regDate);
		paramMap.put("isActivated", isActivated);
		paramMap.put("start", (currentPage-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		
		return userDao.selectAllUserList(paramMap);
	}

	public int totalUserInfoCount(String keyWord, String regDate,Integer isActivated) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("keyWord", keyWord);
		paramMap.put("regDate", regDate);
		paramMap.put("isActivated", isActivated);
		return userDao.totalUserInfoCount(paramMap);
	}
	
	public void addUser(UserInfo userInfo) {
		// TODO Auto-generated method stub
		userDao.addUser(userInfo);	
	}
}
