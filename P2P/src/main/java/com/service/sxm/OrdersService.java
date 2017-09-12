package com.service.sxm;

import java.util.List;

import com.entity.tzt.Orders;

public interface OrdersService {
	public List selectOrders(Orders o);
	public int insertOrders(Orders o);
}
