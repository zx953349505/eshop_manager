package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.TypeInfo;


public interface TypeBiz {
	/**
	 * ��ѯ��������
	 * @return
	 */
	List<TypeInfo> selectTypeAll();
	
	/**
	 * ��ѯ����
	 * @return
	 */
	List<TypeInfo> selectType();

	/**
	 * ��ѯ����������
	 * @return
	 */
	List<TypeInfo> selectChildTypeAll();
}