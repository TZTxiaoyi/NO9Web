package com.serviceimpl.tzt;

import java.net.PasswordAuthentication;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.AccountsDaotzt;
import com.dao.tzt.EmployeeDaotzt;
import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.service.tzt.LoginServicetzt;
@Service
public class LoginServicetztImpl implements LoginServicetzt {
	@Autowired
	AccountsDaotzt accountsDaotzt;
	@Autowired
	EmployeeDaotzt employeeDaotzt;

	/**
	 * 
	 * Title: register 
	 * Description:  娉ㄥ唽璐﹀彿
	 * @param accounts 璐﹀彿淇℃伅
	 * @return   int
	 * @see com.service.tzt.LoginServicetzt#register(com.entity.tzt.Accounts)
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public int register(Accounts accounts) {
		Employee employee = new Employee();
		employee.setUsername(accounts.getAccounts());
		employeeDaotzt.addEmployee(employee);
		accounts.setEmpid(employee.getEmpid());
		return accountsDaotzt.addAccounts(accounts);
	}

	
	/**
	 * 
	 * Title: login  查找关于该账号的信息方法 然后匹配登录
	 * Description:  
	 * @param accounts 账号信息
	 * @return   JSON resultType为返回种类。若为noselet则为没有查找到该账号 若为passwordsFalse则为密码错误
	 * 
	 * @see com.service.tzt.LoginServicetzt#login(com.entity.tzt.Accounts)
	 */
	public String login(Accounts accounts) {
		Map result =new HashMap();
		Employee employee=new Employee();
		List<Map> loginAccounts=accountsDaotzt.queryAccounts(accounts);
		employee.setEmpid(Integer.valueOf(loginAccounts.get(0).get("EMPID").toString()));
		List<Map> loginEmployee=employeeDaotzt.queryEmployee(employee);
		if(loginAccounts.size()==0){
			result.put("resultType", "noselect");
			return JSON.toJSONString(result);
		}else if (loginAccounts.get(0).get("PASSWORDS").equals(accounts.getPasswords())) {
			result.put("resultType", "true");
			result.put("resultAccounts", loginAccounts);
			result.put("resultEmployee", loginEmployee);
			
			return JSON.toJSONString(result);

		}else{
			result.put("resultType", "passwordsFalse");
			
			return JSON.toJSONString(result);
		}
		
	}



}
