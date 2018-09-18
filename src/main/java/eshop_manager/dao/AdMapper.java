package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.AdInfo;

public interface AdMapper {
	/**
	 * 查询所有广告
	 * @return
	 */
	List<AdInfo> selectAdInfo();
	/**
	 * 根据adname删除ad
	 * @param ad_name
	 */
	void deleteAdByName(String ad_name);
	/**
	 * 添加广告
	 * @param adInfo
	 */
	void addAdvertise(AdInfo adInfo);
}
