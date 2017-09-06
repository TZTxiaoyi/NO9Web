package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.EmployeeDao;
import com.entity.zb.Employee;
import com.service.zb.EmployeeService;
/**
 * 
 * @ClassName:  EmployeeServiceImpl   
 * @Description:TODO(shiwuceng个人资料)   
 * @author: 朱彬
 * @date:   2017年9月1日 下午7:39:47   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDao edao;
	
	@Override
	public List<Object> queryEmployee() {
		// TODO Auto-generated method stub
		return edao.queryEmployee();
	}

	@Override
	public int addEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return edao.addEmployee(employee);
	}

	@Override
	public int updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return edao.updateEmployee(employee);
	}

}
