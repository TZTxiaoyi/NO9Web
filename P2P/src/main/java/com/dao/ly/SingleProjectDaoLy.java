package com.dao.ly;

import java.util.List;

import com.entity.ly.Project;

public interface SingleProjectDaoLy {
	List<Object> selectProject();
	List<Object> selectsin(Project projectsid);
}
