package com.serviceimpl.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.ProjectsDaoLy;
import com.entity.ly.AuditingRe;
import com.entity.ly.Project;
import com.entity.tzt.Employee;
import com.service.ly.AddEmployeeService;
@Service
public class AddEmpServiceImpl implements AddEmployeeService{
	@Autowired
	ProjectsDaoLy projectsDaoLy;
	
	//给项目添加一个审批人
	public int upProEmplo(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.upProEmployee(projectsid);
	}

	//点击审核时给审核记录一个初始数据，审批人、项目序号、开始审核时间
	public int insAudiRecord(AuditingRe aRe) {
		// TODO Auto-generated method stub
		return projectsDaoLy.insAuditingRe(aRe);
	}

	//修改审核记录表，添加结束时间
	public int upRecTable(Map aRe) {
		// TODO Auto-generated method stub
		return projectsDaoLy.upRecordTab(aRe);
	}

	//查看审核记录表
	public List<Object> selPassProj(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.selPassPro(projectsid);
	}


	public List<Object> selUnPassProj(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.selUnpassPro(projectsid);
	}
	
}
