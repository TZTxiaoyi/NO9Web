package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;

public interface ReturnProjectsDaoLjl {
	public int SaveReturnProjects(Map map);
	public int UpdateReturnProjects(Map map);
	public List AllReturnProjects(ReturnLjl returnljl);
	public int DeleteReturnProjects(ReturnLjl returnljl);
	public int SExamine(ProjectsLjl projectsljl);
	
	public List TopReturn(Map map);
	public int updateprodate(Map map);
}
