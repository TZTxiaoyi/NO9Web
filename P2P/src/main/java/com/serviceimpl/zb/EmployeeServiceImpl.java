package com.serviceimpl.zb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	

	@Override
	public int addEmployee(Employeezb employee) {
		// TODO Auto-generated method stub
		return edao.addEmployee(employee);
	}

	/*@Override
	public int updateEmployee(Employeezb employee) {
		return edao.updateEmployee(employee);
	}*/

	@Override
	public int updateEmployee(Map map) {
		// TODO Auto-generated method stub
		return edao.updateEmployee(map);
	}

	@Override
	public List<Object> queryEmployee(int empid) {
		// TODO Auto-generated method stub
		return edao.queryEmployee(empid);
	}

}
