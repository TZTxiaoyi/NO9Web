package com.service.ly;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Roletable;

public interface queryAccountService {
	Roletable queryRolename(Roletable roletable);//查询账号
	

	List<Object> queryPowers(Roletable roletable);//查询用户权限
	
	
	public int insPowers(String string);
}
