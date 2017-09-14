package com.serviceimpl.ljl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.MyOrdersDaoLjl;
import com.entity.tzt.Orders;
import com.service.ljl.OrdersServiceLjl;
@Service
public class OrdersServiceImplLjl implements OrdersServiceLjl{
	@Autowired
	MyOrdersDaoLjl myorders;
	@Override
	public List AllOrders(Orders orders) {
		List list=myorders.AllOrders(orders);
		return list;
	}

	@Override
	public String UpdateOrders(Orders orders) {
		int flag=myorders.UpdateOrders(orders);
		if(flag==1){
			return "success";
			
		}
		return "err";
	}

}
