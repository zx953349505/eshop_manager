package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.IpInfo;


public interface IpBiz {
	/**
	 * ≤È—ØipList
	 * @return
	 */
	List<IpInfo> selectIpInfo();
	
}
