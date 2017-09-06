package com.service.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;

public interface ProIndetailService {
	public List<Object> selProI(Map mm);
	public List<Object> selInde(Project projectsid);
}
