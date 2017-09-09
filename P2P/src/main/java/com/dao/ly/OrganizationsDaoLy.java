package com.dao.ly;

import java.util.List;

import com.entity.ly.Project;

public interface OrganizationsDaoLy {
	List<Object> selectOrgas();
	List<Object> selOrgAuditing(Project projectsid);//机构信息审核
	List<Object> selOrAudit(Project projectsid);//机构信息审核记录
}
