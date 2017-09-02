package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Employee;

public interface employeeDaotzt {
	List<Map> queryEmployee(Employee employee);
	int  addEmployee(Employee employee);
}
