package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.AddressInfo;

public interface AddressMapper {

	/**
	 * ��ѯʡ����Ϣ
	 * @return
	 */
	List<AddressInfo> selectProvinceList();
	
	/**
	 * ����ʡ��id��ѯ����Ϣ
	 * @param provinceid
	 * @return
	 */
	List<AddressInfo> selectCityList(String provinceid);
	
	/**
	 * ������id��ѯ����Ϣ
	 * @param cityid
	 * @return
	 */
	List<AddressInfo> selectAreaList(String cityid);
	
	
	
}
