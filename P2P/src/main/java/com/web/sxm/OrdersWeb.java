package com.web.sxm;

import java.util.List;
import java.util.Map;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.ljl.ProjectsDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Orders;
import com.service.sxm.OrdersService;
/**
 * 
    * @ClassName: OrdersWeb  
    * @Description: TODO(这里用一句话描述这个类的作用)  支持订单，未回报，已回报，回报中订单的查询
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Controller
@RequestMapping("OrdersWeb")
public class OrdersWeb {
	@Autowired
	OrdersService ordersService;
	
	/**
	 * 
	    * @Title: supportOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 查询已完成订单 ，支持订单 
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/supportOrders")
	public List supportOrders(@RequestBody Orders o) {
		System.out.println("-------support------------");
		List list=ordersService.supportOrders(o);
		System.out.println("支持"+list);
		return list;
		
	}
	/**
	 * 
	    * @Title: selectOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 等待回报项目 
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectOrders")
	public List selectOrders(@RequestBody Orders o){
		List tList =ordersService.selectOrders(o);
		System.out.println("orders"+tList);
		//response.setCharacterEncoding("utf-8");
		return tList;
	}
	/**
	 * 
	    * @Title: insertOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  点击支持按钮插入订单
	    * @param @param o
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/insertOrders")
	public int insertOrders(@RequestBody Orders o){
		System.out.println(o.getOrdertime());
		return ordersService.insertOrders(o);
	}
	/**
	 * 
	    * @Title: selectAdress  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询回报地址
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectAdress")
	public List selectAdress(@RequestBody Orders o){
		System.out.println(o.getAddress());
		return ordersService.selectAdress(o);
	}
	/**
	 * 
	    * @Title: selectback  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询回报中项目  
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectback")
	public List selectback(@RequestBody Orders o) {
		return ordersService.selectback(o);
	}
	/**
	 * 
	    * @Title: selectalreadyback  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询已回报项目
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectalreadyback")
	public List selectalreadyback(@RequestBody Orders o) {
		return ordersService.selectalreadyback(o);
		
	}
}
