package com.service.ljl;

import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;

public interface ProjectsServiceLjl {
	public String AllProjects(UserLjl user);
	public String SaveProjects(ProjectsLjl proLjl);
	public String AllProjectsType();
}
