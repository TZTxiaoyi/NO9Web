package com.dao.zb;

import java.util.List;

import com.entity.zb.Employeezb;

/**
 * 
 * @ClassName:  EmployeeDao   
 * @Description:TODO(�������ϵ�dao�ӿ�)   
 * @author: ���
 * @date:   2017��9��1�� ����7:33:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface EmployeeDao {
	public List<Object> queryEmployee();
	public int addEmployee(Employeezb employee);
	public int updateEmployee(Employeezb employee);
}
