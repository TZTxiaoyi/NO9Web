package com.serviceimpl.tzt;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.tzt.CapitalDaotzt;
import com.dao.tzt.PromoneyDaotzt;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Capital;
import com.service.tzt.ProjectMoneyServicetzt;

@Service
public class ProjectMoneyServicetztImpl implements ProjectMoneyServicetzt {

	@Autowired
	PromoneyDaotzt promoneyDaotzt;
	@Autowired
	CapitalDaotzt capitalDaotzt;
	
	public List<Map> queryProjectMoney(ProjectsLjl projectsLjl) {
		
		return promoneyDaotzt.queyrProjectMoney(projectsLjl);
	}

	@Override
	public List<Map> queryProjectMoneyinfo(ProjectsLjl projectsLjl) {
		Capital capital =new Capital();
		capital.setProjectsid(projectsLjl.getProjectsid());
		return capitalDaotzt.queryCapital(capital);
	}

}
