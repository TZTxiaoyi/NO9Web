package com.service.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.ProjectsMoneyinfotzt;

public interface ProjectsServerstzt {
	public String RemoveProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt);
	public String FinshProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt);
	public List<Map> queryAllProjectAudit();
}
