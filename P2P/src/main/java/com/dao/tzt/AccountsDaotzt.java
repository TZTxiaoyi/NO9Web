package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;

public interface AccountsDaotzt {
	public List<Map> queryAccounts(Accounts accounts);
	public int addAccounts(Accounts accounts);
	public int updateAccounts(Accounts accounts);
}
