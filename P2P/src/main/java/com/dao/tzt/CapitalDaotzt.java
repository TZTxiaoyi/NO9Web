package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Capital;

/**
 * @类功能说明：  平台资金记录表
 * @作者：TZT  
 * @创建时间：2017年9月14日 下午4:25:05
 */
public interface CapitalDaotzt {
	public List<Map> queryCapital(Capital capital);
	public int addCapital(Capital capital);
	public int addCapitalRemoveProjectList(List<Map> list);
}
