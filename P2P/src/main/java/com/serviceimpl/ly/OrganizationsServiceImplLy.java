package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.OrganizationsDaoLy;
import com.entity.ly.Project;
import com.service.ly.OrganizationsServiceLy;
@Service
public class OrganizationsServiceImplLy implements OrganizationsServiceLy{

	@Autowired
	OrganizationsDaoLy organizationsDaoLy;
	
	public List<Object> selecOrgas() {
		// TODO Auto-generated method stub
		return organizationsDaoLy.selectOrgas();
	}
	/**
	 * 机构信息审核
	 */
	public List<Object> selOraAuditing(Project projectsid){
		return organizationsDaoLy.selOrgAuditing(projectsid);
	}
	/**
	 * 机构信息审核记录
	 */
	@Override
	public List<Object> selecOrgasAudi(Project projectsid) {
		// TODO Auto-generated method stub
		return organizationsDaoLy.selOrAudit(projectsid);
	}

}
