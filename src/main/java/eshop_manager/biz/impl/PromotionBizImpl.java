package eshop_manager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.PromotionBiz;
import eshop_manager.dao.PromotionMapper;
import eshop_manager.entity.PromotionInfo;

public class PromotionBizImpl implements PromotionBiz{
	@Autowired
	private PromotionMapper promotionMapper;

	public List<PromotionInfo> selectPromotionInfo() {
		// TODO Auto-generated method stub
		return promotionMapper.selectPromotionInfo();
	}

	public void deleteProByName(String promotion_context) {
		// TODO Auto-generated method stub
		promotionMapper.deleteProByName(promotion_context);
	}

	public void addPromotion(PromotionInfo proInfo) {
		// TODO Auto-generated method stub
		promotionMapper.addPromotion(proInfo);
	}
}
