package com.service.sxm;

import java.util.List;

import com.entity.tzt.Orders;

public interface OrdersService {
	/**
	 * 
	    * @Title: supportOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 查询已完成订单  
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List supportOrders(Orders o);
	/**
	 * 
	    * @Title: selectOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 等待回报项目
	    * @param @param o 订单对象
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectOrders(Orders o);
	/**
	 * 
	    * @Title: insertOrders  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  点击支持按钮插入订单
	    * @param @param o
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	public int insertOrders(Orders o);
	/**
	 * 
	    * @Title: selectAdress  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询回报地址
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectAdress(Orders o);
	/**
	 * 
	    * @Title: selectback  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 查询回报中项目  
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectback(Orders o);
	/**
	 * 
	    * @Title: selectalreadyback  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询已回报项目
	    * @param @param o
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectalreadyback(Orders o);
	/*public int updateOrders(Integer ordid);*/
}
