package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.zb.Employeezb;

public interface EmployeeDaoLjl {
	public List AllEmployee(Map map);
	public int UpdateEmployee(Map map);
	public int UpdateEmployees(List list);
	public int InsertTransaction(Map map);
	public int InsertTransactionList(List list);
	
	public List AllTransactionRecord(Map emp);

}
