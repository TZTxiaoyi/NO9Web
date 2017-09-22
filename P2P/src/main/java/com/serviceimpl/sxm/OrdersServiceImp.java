package com.serviceimpl.sxm;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.ProjectsDaoLjl;
import com.dao.sxm.OrdersDao;
import com.entity.tzt.Orders;
import com.service.sxm.OrdersService;
/**
 * 
    * @ClassName: OrdersServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  回报记录页面的插入和查询
    * @author ASUS  
    * @date 2017年9月14日  
    *
 */
@Service
public class OrdersServiceImp implements OrdersService{
	@Autowired
	OrdersDao oDao;
	@Autowired
	ProjectsDaoLjl prodao;
	@Override
	/**
	 * 等待回报项目
	 */
	public List selectOrders(Orders o) {
		// TODO Auto-generated method stub
		List<Map> pro=prodao.retProjects(o);
		Map promap=pro.get(0);
		System.out.println(promap);
		Integer projectsid=Integer.parseInt(promap.get("PROJECTSID").toString());
		o.setProjectsid(projectsid);
		
		return oDao.selectOrders(o);
	}
	@Override
	/**
	 * 点击支持按钮插入订单
	 */
	public int insertOrders(Orders o) {
		// TODO Auto-generated method stub
		
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate );
		o.setOrdertime(hehe);
		return oDao.insertOrders(o);
	}
	@Override
	/**
	 * 查询回报地址
	 */
	public List selectAdress(Orders o) {
		// TODO Auto-generated method stub
		return oDao.selectAdress(o);
	}
	@Override
	/**
	 * 查询回报中项目  
	 */
	public List selectback(Orders o) {
		// TODO Auto-generated method stub
		List<Map> pro=prodao.retProjects(o);
		Map promap=pro.get(0);
		Integer projectsid=Integer.parseInt(promap.get("PROJECTSID").toString());
		o.setProjectsid(projectsid);
		return oDao.selectback(o);
	}
	@Override
	/**
	 * 查询已回报项目
	 */
	public List selectalreadyback(Orders o) {
		// TODO Auto-generated method stub
		List<Map> pro=prodao.retProjects(o);
		Map promap=pro.get(0);
		Integer projectsid=Integer.parseInt(promap.get("PROJECTSID").toString());
		o.setProjectsid(projectsid);
		return oDao.selectalreadyback(o);
	}
	@Override
	/**
	 * 查询已完成订单 
	 */
	public List supportOrders(Orders o) {
		// TODO Auto-generated method stub
		return oDao.supportOrders(o);
	}
}
