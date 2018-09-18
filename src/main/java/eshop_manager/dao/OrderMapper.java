package eshop_manager.dao;


import java.util.List;
import java.util.Map;

import eshop_manager.entity.OrderInfo;



public interface OrderMapper {
	/**
	 * 根据条件查询订单数
	 * @param user_id
	 * @return
	 */
	int selectOrderList(Map<String, Object> map);
	/**
	 * 查询本月营业额
	 * @return
	 */
	double selectOrderPrice();
	
	/**
	 * 查询所有订单列表
	 * @return
	 */
	List<OrderInfo> queryOrderList(Map<String, Object> paramMap);
	
	/**
	 * 查询订单数总数
	 * @return
	 */
	int totalOrderCount();
	
	/**
	 * 查询订单详情
	 * @param order_id
	 * @return
	 */
	OrderInfo selectOrderInfo(String order_id);
	
	/**
	 * 删除单个订单
	 * @param order_id
	 * @return
	 */
	void deleteSingleOrder(String order_id);
	
	/**
	 * 批量删除订单
	 * @param order_id
	 * @return
	 */
	void deleteManyOrder(List<String> orderIds);

	/**
	 * 批量取消订单
	 * @param order_id
	 * @return
	 */
	void cancelManyOrder(List<String> orderIds);

}
