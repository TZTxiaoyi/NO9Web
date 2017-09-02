package com.dao.ljl;

import java.util.List;

import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;

public interface ProjectsDaoLjl {
	public List AllProjects(UserLjl user);
	public int SaveProjects(ProjectsLjl proLjl);
	public List AllProjectsType();
	
}
