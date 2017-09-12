package com.service.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.DescribeAudi;
import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;

public interface ProIndetailService {
	public List<Object> selProI(Map mm);
	public List<Object> selInde(Project projectsid);
	public List<Object> selProDesRe(Project projectsid);//查询项目描述审核记录
	public int inProDescribeReco(DescribeAudi projectsid);//保存项目描述审核记录
}
