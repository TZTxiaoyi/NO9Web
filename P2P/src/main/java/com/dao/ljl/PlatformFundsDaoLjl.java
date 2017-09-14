package com.dao.ljl;

import java.util.Map;

import com.entity.ljl.PlatformFundsLjl;

public interface PlatformFundsDaoLjl {
	public int Updatefund(Map map);
	public int Updatefunds(PlatformFundsLjl platformfunds);
	
	public int InsertCapital(Map map);//平台资金操作
}
