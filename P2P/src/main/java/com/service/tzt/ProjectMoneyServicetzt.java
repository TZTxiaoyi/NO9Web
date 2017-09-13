package com.service.tzt;

import java.util.List;
import java.util.Map;

import com.entity.ljl.ProjectsLjl;

public interface ProjectMoneyServicetzt {
	public List<Map> queryProjectMoney(ProjectsLjl projectsLjl);
	public List<Map> queryProjectMoneyinfo(ProjectsLjl projectsLjl);
}
