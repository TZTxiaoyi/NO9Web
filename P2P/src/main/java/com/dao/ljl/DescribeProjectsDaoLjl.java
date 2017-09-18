package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.DescribeLjl;
import com.entity.ly.Project;

public interface DescribeProjectsDaoLjl {
	public int SaveDescribeProjects();
	public int UpdateDescribeProjects(DescribeLjl describe);
	public List AllDescribeProjects(DescribeLjl describe);
	public List AllDescribeProject(Project projecstid);
	
	public int addPromoney(Map promoney);
}
