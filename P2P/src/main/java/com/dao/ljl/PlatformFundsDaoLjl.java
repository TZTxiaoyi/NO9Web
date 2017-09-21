package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.PlatformFundsLjl;

public interface PlatformFundsDaoLjl {
	public int Updatefund(Map map);
	public int Updatefunds(PlatformFundsLjl platformfunds);
	public int UpdatefundsList(List list);
	public int eUpdatefund(Map map);
	public int InsertCapital(Map map);//平台资金操作
	public int InsertCapitalList(List list);//平台资金操作记录
}
