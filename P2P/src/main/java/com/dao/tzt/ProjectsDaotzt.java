package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.ProjectsMoneyinfotzt;

public interface ProjectsDaotzt {
	public int updataProject(ProjectsMoneyinfotzt projectsMoneyinfotzt);
	public int updataProjectFinsh(ProjectsMoneyinfotzt projectsMoneyinfotzt);
	public List<Map> queryAllProjectsAudit();
}
