package com.dao.ljl;

import java.util.List;

import com.entity.ljl.DescribeLjl;

public interface DescribeProjectsDaoLjl {
	public int SaveDescribeProjects();
	public int UpdateDescribeProjects(DescribeLjl describe);
	public List AllDescribeProjects(DescribeLjl describe);
}
