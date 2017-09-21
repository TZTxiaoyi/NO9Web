package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.PerProLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.entity.tzt.Orders;

public interface ProjectsDaoLjl {
	public List AllProjects(UserLjl user);
	public int SaveProjects(ProjectsLjl proLjl);
	public List AllProjectsType();
	public int DelProjects(ProjectsLjl proLjl);
	public int DelDescribe(ProjectsLjl proLjl);
	public int DelIndetail(ProjectsLjl proLjl);
	public int DelPersonal(ProjectsLjl proLjl);
	public int DelReturn(ProjectsLjl proLjl);
	
	public int UpdateProType(PerProLjl perpro);
	public int UpdateProuu(Map map);
	//初始化项目创建多表
	public int SaveDescribeProjects(Map map);//项目描述表
	public int SaveIndetailProjects(Map map);//项目详情表
	public int SaveOrganizationsProjects(Map map);//机构项目基础信息
	public int SavePersonalProjects(Map map);//个人项目基础信息
	public int SaveReturnProjects(Map map);//项目回报
	
	public List countProjects(ProjectsLjl proLjl);
	public List retProjects(Orders o);
	
}
