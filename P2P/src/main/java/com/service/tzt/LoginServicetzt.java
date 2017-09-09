package com.service.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;

public interface LoginServicetzt {
	public int register(Accounts  accounts);
	 public String login(Accounts  accounts);
	public int updateAccounts(Map map);
}
