package com.service.zb;

import java.util.List;

import com.entity.zb.Employee;

/**
 * 
 * @ClassName:  EmployeeService   
 * @Description:TODO(EmployeeService)   
 * @author: ���
 * @date:   2017��9��1�� ����7:36:39   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeService {
	public List<Object> queryEmployee();
	public int addEmployee(Employee employee);
	public int updateEmployee(Employee employee);
}
