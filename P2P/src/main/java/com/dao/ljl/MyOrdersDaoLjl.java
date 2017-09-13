package com.dao.ljl;

import java.util.List;

import com.entity.tzt.Orders;

public interface MyOrdersDaoLjl {
	public List AllOrders(Orders orders);
	public int UpdateOrders(Orders orders);
}
