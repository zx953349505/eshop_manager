package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.TypeInfo;



public interface TypeMapper {
	/**
	 * 查询类型
	 * @return
	 */
	List<TypeInfo> selectType();
	/**
	 * 查询所有类型
	 * @return
	 */
	List<TypeInfo> selectTypeAll();
	/**
	 * 查询所有子类型
	 * @return
	 */
	List<TypeInfo> selectChildTypeAll();
	/**
	 * 增加类型
	 */
	void addtype();
}
