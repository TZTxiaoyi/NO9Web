package com.dao.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.DescribeAudi;
import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;

public interface ProIndetailDao {
	List<Object> selProIn(Map mm);
	List<Object> selDescribe(Project projectsid);
	
	List<Object> selProDeAuRe(Project projectsid);//查询项目描述审核记录
	int inProDesAuRe(DescribeAudi projectsid);//保存项目描述审核记录
}
