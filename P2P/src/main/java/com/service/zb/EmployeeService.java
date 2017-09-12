package com.service.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Employeezb;

/**
 * 
 * @ClassName:  EmployeeService   
 * @Description:TODO(employe)   
 * @author: 朱彬
 * @date:   2017年9月11日 下午2:43:14   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeService {
	public List<Object> queryEmployee();
	public int addEmployee(Employeezb employee);
	public int updateEmployee(Map map);
}
