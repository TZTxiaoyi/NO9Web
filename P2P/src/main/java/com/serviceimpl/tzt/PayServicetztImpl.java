package com.serviceimpl.tzt;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dao.tzt.CapitalDaotzt;
import com.dao.tzt.OrdersDaotzt;
import com.dao.tzt.PromoneyDaotzt;
import com.entity.tzt.Capital;
import com.entity.tzt.Orders;
import com.entity.tzt.Promoney;
import com.service.tzt.PayServicetzt;

import oracle.net.aso.p;

public class PayServicetztImpl implements PayServicetzt {

	@Autowired
	OrdersDaotzt ordersDaotzt;
	@Autowired
	PromoneyDaotzt promoneyDaotzt;
	@Autowired
	CapitalDaotzt capitalDaotzt;
	@Autowired
	
	
	@Transactional(propagation=Propagation.REQUIRED)
	public String payService(Orders orders) {
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate ); 
		Capital capital = new Capital();
		Promoney promoney =new Promoney();
		
		orders.setOrdertime(hehe);
		ordersDaotzt.addOrders(orders);
		capitalDaotzt.addCapital(capital);
		promoneyDaotzt.updatePromoney(promoney);
		return null;
	}

}
