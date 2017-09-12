package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Orders;


public interface OrdersDaotzt {
	public List<Map> queryOrders(Orders orders);
	public int addOrders(Orders orders);
	public int  updateOrders(Orders orders);
}
