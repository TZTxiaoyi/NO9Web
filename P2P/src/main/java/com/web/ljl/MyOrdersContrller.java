package com.web.ljl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.tzt.Orders;
import com.service.ljl.OrdersServiceLjl;

@Controller
@RequestMapping("MyOrdersContrller")
public class MyOrdersContrller {
	@Autowired
	OrdersServiceLjl ordersservice;
	/**
	 * 查询用户订单
	 */
	@RequestMapping("/AllOrders")
	@ResponseBody
	public List AllOrders(@RequestBody Orders orders){
		List list=ordersservice.AllOrders(orders);
		System.out.println(list);
		return list;
	}
	/**
	 * 用户收货更新用户的订单
	 */
	@RequestMapping("/UpdateOrders")
	@ResponseBody
	public String UpdateOrders(Orders orders){
		orders.setOrdstatus(81);
		String str=ordersservice.UpdateOrders(orders);
		return str;
	}
}
