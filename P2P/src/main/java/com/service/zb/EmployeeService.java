package com.service.zb;

import java.util.List;

import com.entity.zb.Employee;

/**
 * 
 * @ClassName:  EmployeeService   
 * @Description:TODO(EmployeeService)   
 * @author: 朱彬
 * @date:   2017年9月1日 下午7:36:39   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeService {
	public List<Object> queryEmployee();
	public int addEmployee(Employee employee);
	public int updateEmployee(Employee employee);
}
