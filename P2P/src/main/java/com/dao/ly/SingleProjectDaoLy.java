package com.dao.ly;

import java.util.List;

import com.entity.ly.Project;

public interface SingleProjectDaoLy {
	List<Object> selectProject(int approver);//个人项目里只显示自己要审核的项目
	List<Object> selectsin(Project projectsid);
}
