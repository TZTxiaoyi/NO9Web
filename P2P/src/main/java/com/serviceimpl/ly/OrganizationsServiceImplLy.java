package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.OrganizationsDaoLy;
import com.service.ly.OrganizationsServiceLy;
@Service
public class OrganizationsServiceImplLy implements OrganizationsServiceLy{

	@Autowired
	OrganizationsDaoLy organizationsDaoLy;
	public List<Object> selecOrgas() {
		// TODO Auto-generated method stub
		return organizationsDaoLy.selectOrgas();
	}
	
	
}
