package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;

public interface accountsDaotzt {
	public List<Map> queryAccounts(Accounts accounts);
	public int addAccounts(Accounts accounts);
}
