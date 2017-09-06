package com.dao.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;

public interface ProIndetailDao {
	List<Object> selProIn(Map mm);
	List<Object> selDescribe(Project projectsid);
}
