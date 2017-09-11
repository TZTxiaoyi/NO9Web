package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;

public interface ProfitDaotzt {
	public List<Map> queryProfit(Accounts accounts);
	public int addProfit(Accounts accounts);
}
