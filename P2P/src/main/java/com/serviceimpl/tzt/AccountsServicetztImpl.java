package com.serviceimpl.tzt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.soap.Addressing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.AccountsDaotzt;
import com.dao.tzt.EmployeeDaotzt;
import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.service.tzt.AccountsServicetzt;

@Service
public class AccountsServicetztImpl implements AccountsServicetzt {

	@Autowired
	AccountsDaotzt accountsDaotzt;
	@Autowired
	EmployeeDaotzt employeeDaotzt;
	public List<Map> queryAccountsTable(Accounts accounts) {
		return accountsDaotzt.queryAccounts(accounts);
	}

	public List<Map> queryEmployee(Employee employee) {
		return employeeDaotzt.queryEmployee(employee);
	}

	@Override
	public int updateAccounts(Map map) {
		
		return accountsDaotzt.updateAccounts(map);
	}

	public String updateAccounts(Accounts accounts) {
		Map result =new HashMap();
		int flag = accountsDaotzt.updateAccountsRole(accounts);
		if(flag!=0){
			result.put("resultType", true);
		}else{
			result.put("resultType", false);
		}
		return JSON.toJSONString(result);
	}
	


}
