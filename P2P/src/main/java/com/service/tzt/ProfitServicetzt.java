package com.service.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Profit;

public interface ProfitServicetzt {
	public List<Map> queryProfit(Profit profit);
	public int addProfit(Profit profit);
}
