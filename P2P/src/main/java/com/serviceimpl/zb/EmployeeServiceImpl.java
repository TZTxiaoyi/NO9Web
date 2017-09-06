package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.EmployeeDao;
import com.entity.zb.Employeezb;
import com.service.zb.EmployeeService;
/**
 * 
 * @ClassName:  EmployeeServiceImpl   
 * @Description:TODO(shiwuceng��������)   
 * @author: ���
 * @date:   2017��9��1�� ����7:39:47   
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
	public int addEmployee(Employeezb employee) {
		// TODO Auto-generated method stub
		return edao.addEmployee(employee);
	}

	@Override
	public int updateEmployee(Employeezb employee) {
		// TODO Auto-generated method stub
		return edao.updateEmployee(employee);
	}

}
