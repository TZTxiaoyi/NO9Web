package com.dao.ljl;

import java.util.List;
import java.util.Map;

public interface IndetailProjectsDaoLjl {
	public int SaveIndetailProjects();
	public int UpdateIndetailProjects();
	public List AllIndetailProjects();
	
	public int SvaeText(Map map);
	public int UpdateText(Map map);
}
