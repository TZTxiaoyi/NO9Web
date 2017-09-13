package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Orders;
import com.service.sxm.OrdersService;

@Controller
@RequestMapping("OrdersWeb")
public class OrdersWeb {
	@Autowired
	OrdersService ordersService;
	@ResponseBody
	@RequestMapping(value="/selectOrders")
	public List selectOrders(@RequestBody Orders o){
		List tList =ordersService.selectOrders(o);
		System.out.println("orders"+tList);
		//response.setCharacterEncoding("utf-8");
		return tList;
	}
	@ResponseBody
	@RequestMapping(value="/insertOrders")
	public int insertOrders(@RequestBody Orders o){
		System.out.println(o.getOrdertime());
		return ordersService.insertOrders(o);
	}
}
