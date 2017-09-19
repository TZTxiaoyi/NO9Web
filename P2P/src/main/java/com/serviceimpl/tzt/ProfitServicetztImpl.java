package com.serviceimpl.tzt;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.tzt.ProfitDaotzt;
import com.entity.tzt.Profit;
import com.service.tzt.ProfitServicetzt;

@Service
public class ProfitServicetztImpl implements ProfitServicetzt{

	@Autowired
	ProfitDaotzt profitDaotzt;
	
	public List<Map> queryProfit(Profit profit) {
		
		return profitDaotzt.queryProfit(profit);
	}

	public int addProfit(Profit profit) {
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate ); 
		profit.setStarttime(hehe);
		return profitDaotzt.addProfit(profit);
	}

}
