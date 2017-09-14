package com.serviceimpl.sxm;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.OrdersDao;
import com.entity.tzt.Orders;
import com.service.sxm.OrdersService;
@Service
public class OrdersServiceImp implements OrdersService{
	@Autowired
	OrdersDao oDao;
	@Override
	public List selectOrders(Orders o) {
		// TODO Auto-generated method stub
		return oDao.selectOrders(o);
	}
	@Override
	public int insertOrders(Orders o) {
		// TODO Auto-generated method stub
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate );
		o.setOrdertime(hehe);
		return oDao.insertOrders(o);
	}

}
