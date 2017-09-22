package com.service.ly;

import java.util.List;

import com.entity.ly.Project;

public interface SingleProjectServiceLy {
	public List<Object> selectpro(int approver);
	public List<Object> selprojects();
	public List<Object> selsingle(Project projectsid);
}
