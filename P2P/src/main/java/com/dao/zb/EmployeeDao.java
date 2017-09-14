package com.dao.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Employeezb;

/**
 * 
 * @ClassName:  EmployeeDao   
 * @Description:TODO(员工的Dao接口)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:07:46   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeDao {
	public List<Object> queryEmployee();
	public int addEmployee(Employeezb employee);
	public int updateEmployee(Map map);
}
