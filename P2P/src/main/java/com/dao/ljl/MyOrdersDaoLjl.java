package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Orders;

public interface MyOrdersDaoLjl {
	public List AllOrders(Orders orders);
	public int UpdateOrders(Orders orders);
	public int UpdateOrder(Map map);
	public int UpdateOrderList(List list);
}
