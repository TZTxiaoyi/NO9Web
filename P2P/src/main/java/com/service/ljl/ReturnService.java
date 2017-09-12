package com.service.ljl;

import java.util.Map;

import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;

public interface ReturnService {
	public String SaveReturn(Map map);
	public String DeleteReturn(ReturnLjl returnljl);
	public Map AllReturn(ReturnLjl returnljl);
	public String SExamine(ProjectsLjl projectsljl);
}
