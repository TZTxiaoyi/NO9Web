package com.dao.ly;

import java.util.HashMap;
import java.util.List;

import com.entity.tzt.Accounts;

public interface UsersDao {
	Accounts queryAccounts(Accounts accounts);//查询账号

	List<HashMap<String, Object>> queryAllFunction(Accounts accounts);//查询当前用户所有权限

	
}
