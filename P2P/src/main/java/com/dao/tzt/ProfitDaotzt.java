package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Profit;
/**
 * @类功能说明：平台盈利表  
 * @作者：TZT  
 * @创建时间：2017年9月14日 下午4:24:30
 */
public interface ProfitDaotzt {
	public List<Map> queryProfit(Profit profit);
	public int addProfit(Profit profit);
}
