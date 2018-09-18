package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.AdInfo;

public interface AdBiz {
	/**
	 * ��ѯ���й��
	 * @return
	 */
	List<AdInfo> selectAdInfo();
	/**
	 * ����adnameɾ��ad
	 * @param ad_name
	 */
	void deleteAdByName(String ad_name);
	/**
	 * ���ӹ��
	 * @param adInfo
	 */
	void addAdvertise(AdInfo adInfo);
}