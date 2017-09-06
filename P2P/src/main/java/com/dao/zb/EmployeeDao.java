package com.dao.zb;

import java.util.List;

import com.entity.zb.Employee;

/**
 * 
 * @ClassName:  EmployeeDao   
 * @Description:TODO(个人资料的dao接口)   
 * @author: 朱彬
 * @date:   2017年9月1日 下午7:33:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeDao {
	public List<Object> queryEmployee();
	public int addEmployee(Employee employee);
	public int updateEmployee(Employee employee);
}
