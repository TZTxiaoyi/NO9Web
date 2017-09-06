package com.dao.ly;

import java.util.List;

import com.entity.ly.Project;

public interface RepayDao {
	List<Object> selReturn(Project projectsid);
}
