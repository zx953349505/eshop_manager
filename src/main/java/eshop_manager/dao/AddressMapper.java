package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.AddressInfo;

public interface AddressMapper {

	/**
	 * 查询省份信息
	 * @return
	 */
	List<AddressInfo> selectProvinceList();
	
	/**
	 * 根据省份id查询市信息
	 * @param provinceid
	 * @return
	 */
	List<AddressInfo> selectCityList(String provinceid);
	
	/**
	 * 根据市id查询区信息
	 * @param cityid
	 * @return
	 */
	List<AddressInfo> selectAreaList(String cityid);
	
	
	
}
