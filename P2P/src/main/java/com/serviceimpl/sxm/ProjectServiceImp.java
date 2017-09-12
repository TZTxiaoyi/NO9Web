package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProjectDao;
import com.entity.ljl.ProjectsLjl;
import com.service.sxm.ProjectService;
@Service
public class ProjectServiceImp implements ProjectService {
	@Autowired
	ProjectDao pdao;
	@Override
	public List selectProject(ProjectsLjl p) {
		// TODO Auto-generated method stub
		return pdao.selectProject(p);
	}

}
