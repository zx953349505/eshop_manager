package eshop_manager.dao;

import java.util.List;

import eshop_manager.entity.TypeInfo;



public interface TypeMapper {
	/**
	 * ��ѯ����
	 * @return
	 */
	List<TypeInfo> selectType();
	/**
	 * ��ѯ��������
	 * @return
	 */
	List<TypeInfo> selectTypeAll();
	/**
	 * ��ѯ����������
	 * @return
	 */
	List<TypeInfo> selectChildTypeAll();
	/**
	 * ��������
	 */
	void addtype();
}