package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.TypeBiz;
import eshop_manager.dao.TypeMapper;
import eshop_manager.entity.TypeInfo;



public class TypeBizImpl implements TypeBiz {
	@Autowired
	private TypeMapper typeDao;
	
	public List<TypeInfo> selectTypeAll() {
		// TODO Auto-generated method stub
		return typeDao.selectTypeAll();
	}

	public List<TypeInfo> selectType() {
		// TODO Auto-generated method stub
		return typeDao.selectType();
	}

	public List<TypeInfo> selectChildTypeAll() {
		// TODO Auto-generated method stub
		return typeDao.selectChildTypeAll();
	}


}
