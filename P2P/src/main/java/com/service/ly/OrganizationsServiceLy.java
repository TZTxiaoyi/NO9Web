package com.service.ly;

import java.util.List;

import com.entity.ly.Project;

public interface OrganizationsServiceLy {
	
	public List<Object> selecOrgas();//机构信息	
	public List<Object> selOraAuditing(Project projectsid);//机构信息审核
	public List<Object> selecOrgasAudi(Project projectsid);//机构信息审核记录
	
}
