package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Employee;

public interface EmployeeDaotzt {
	List<Map> queryEmployee(Employee employee);
	int  addEmployee(Employee employee);
	public int updataEmployeelist(List<Map> list);
	public int updataEmployeeBalance(Employee employee);
	
}
