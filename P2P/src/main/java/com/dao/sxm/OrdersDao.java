package com.dao.sxm;

import java.util.List;

import com.entity.tzt.Orders;

public interface OrdersDao {
	public List selectOrders(Orders o);
	public int insertOrders(Orders o);
}
