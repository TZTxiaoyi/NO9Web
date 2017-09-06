package com.dao.ljl;

import java.util.List;

import com.entity.ljl.PerProLjl;

public interface PersonalProjectsDaoLjl {
	public int SavePersonalProjects();
	public int UpdatePersonalProjects(PerProLjl perpro);
	public List AllPersonalProjects(PerProLjl perpro);
}
