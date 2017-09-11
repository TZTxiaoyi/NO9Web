package com.dao.ly;

import java.util.List;

import com.entity.ly.Project;

public interface RepayDao {
	List<Object> selReturn(Project projectsid);//回报审核
	List<Object> selReturnRecord(Project projectsid);//回报审核记录
}
