package com.service.ly;

import java.util.List;

import com.entity.ly.Project;

public interface RepayService {
	public List<Object> selReturn(Project projectsid);//回报审核
	public List<Object> selReturnRec(Project projectsid);//回报审核记录
}
