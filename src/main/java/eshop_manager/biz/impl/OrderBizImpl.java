package eshop_manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.OrderBiz;
import eshop_manager.dao.OrderMapper;
import eshop_manager.entity.OrderInfo;

public class OrderBizImpl implements OrderBiz {
	@Autowired
	private OrderMapper orderMapper;
	public int selectOrderList(Integer status_pay, Integer status_send,
			Integer status_receive, Integer status) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status_pay", status_pay);
		map.put("status_send", status_send);
		map.put("status_receive", status_receive);
		map.put("status", status);
		return orderMapper.selectOrderList(map);
	}
	public double selectOrderPrice() {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderPrice();
	}
	
	public List<OrderInfo> queryOrderList(String order_id,String person,
			String order_date,Integer order_status, int currentPage, int pageSize) {
		
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("order_status", order_status);
		paramMap.put("order_id", order_id);
		paramMap.put("person", person);
		paramMap.put("order_date", order_date);
		paramMap.put("start", (currentPage-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		
		return orderMapper.queryOrderList(paramMap);
	}
	
	public int totalOrderCount() {
		// TODO Auto-generated method stub
		return orderMapper.totalOrderCount();
	}
	
	public OrderInfo selectOrderInfo(String order_id) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderInfo(order_id);
	}
	
	public void deleteSingleOrder(String order_id) {
		orderMapper.deleteSingleOrder(order_id);
		
	}
	
	public void deleteManyOrder(List<String> orderIdList) {
				
		orderMapper.deleteManyOrder(orderIdList);
	}
	
	public void cancelManyOrder(List<String> orderIdList) {
		
		orderMapper.cancelManyOrder(orderIdList);
		
	}
	

}
