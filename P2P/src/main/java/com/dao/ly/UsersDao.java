package com.dao.ly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Roletable;

public interface UsersDao {
	Accounts queryAccounts(Accounts accounts);//查询账号

	List<HashMap<String, Object>> queryAllFunction(Accounts accounts);//查询当前用户所有权限
	
	Roletable queryrolename(Roletable roletable);//查询账号
	
	List<Object> queryAllPowers(Roletable Roletable);
	
	public int deletePowers(Map map);
	public int insertPower(List list);
}
