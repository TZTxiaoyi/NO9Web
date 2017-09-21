package com.serviceimpl.zb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.EmployeeDaoLjl;
import com.dao.ljl.PlatformFundsDaoLjl;
import com.dao.zb.EmployeeDao;
import com.entity.zb.Employeezb;
import com.service.zb.EmployeeService;
/**
 * 
 * @ClassName:  EmployeeServiceImpl   
 * @Description:TODO(employee的事务层)   
 * @author: 朱彬
 * @date:   2017年9月11日 下午2:43:55   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDao edao;
	@Autowired
	EmployeeDaoLjl empdao;
	@Autowired
	PlatformFundsDaoLjl platdao;
	

	@Override
	public int addEmployee(Employeezb employee) {
		// TODO Auto-generated method stub
		return edao.addEmployee(employee);
	}

	/*@Override
	public int updateEmployee(Employeezb employee) {
		return edao.updateEmployee(employee);
	}*/
	//充值
	@Override
	public int updateEmployee(Map map) {
		// TODO Auto-generated method stub
		
		Integer money=Integer.parseInt(map.get("balance").toString());
		map.put("details", 176);
		map.put("money", money);
		platdao.eUpdatefund(map);
		empdao.InsertTransaction(map);
		return edao.updateEmployee(map);
	}

	@Override
	public List<Object> queryEmployee(int empid) {
		// TODO Auto-generated method stub
		return edao.queryEmployee(empid);
	}

	@Override
	public List AllTransactionRecord(Map emp) {
		// TODO Auto-generated method stub
		
		return empdao.AllTransactionRecord(emp);
	}

}
