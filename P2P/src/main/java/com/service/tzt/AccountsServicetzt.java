package com.service.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;

public interface AccountsServicetzt {
	public List<Map>queryAccountsTable(Accounts accounts);
	public List<Map> queryEmployee(Employee employee);
	public String updateAccounts(Accounts accounts);
	int updateAccounts(Map map);
}
