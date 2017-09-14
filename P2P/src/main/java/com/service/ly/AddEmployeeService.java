package com.service.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.AuditingRe;
import com.entity.ly.Project;
import com.entity.tzt.Employee;

public interface AddEmployeeService {
	int upProEmplo(Project projectsid);//给项目添加一个审批人
	
	int insAudiRecord(AuditingRe aRe);//点击审核时给审核记录一个初始数据，审批人、项目序号、开始审核时间
	
	int upRecTable(Map aRe);//修改审核记录表，添加结束时间
	
	List<Object> selPassProj(Project projectsid);//查看审核记录表
	List<Object> selUnPassProj(Project projectsid);
}
