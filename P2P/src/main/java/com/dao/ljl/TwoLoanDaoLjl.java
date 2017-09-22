package com.dao.ljl;

import java.util.List;
import java.util.Map;

public interface TwoLoanDaoLjl {
	public List AllReturn();
	
	public int UpdateProState(Map map);
	
	public List selectemoney(Map map);
	public List selectemoneysuc(Map map);
	public List selectordid();
	public int updateorders(List list);
}

