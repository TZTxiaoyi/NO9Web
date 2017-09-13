package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Promoney;

public interface PromoneyDaotzt {
	public List<Map> queryPromoney(Promoney promoney);
	public int addPromoney(Promoney	 promoney);
	public int  updatePromoney(Promoney promoney);
	public List<Map> queyrProjectMoney(ProjectsLjl project);
}
