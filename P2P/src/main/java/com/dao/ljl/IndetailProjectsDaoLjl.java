package com.dao.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.IndetailLjl;
import com.entity.ljl.IndetailPhotoLjl;
import com.entity.ljl.ProjectsLjl;

public interface IndetailProjectsDaoLjl {
	public int SaveIndetailProjects(Map map);
	public int UpdateIndetailProjects(IndetailLjl indetail);
	public List AllIndetailProjects(ProjectsLjl projects);
	public int DelectIndetail(IndetailLjl indetail);
	
	public int SvaeText(Map map);
	public int UpdateText(Map map);
	public int DelectText(IndetailLjl indetail);
	
	public int SvaePhoto(IndetailPhotoLjl IndetailPhoto);
	public int UpdatePhoto(IndetailPhotoLjl IndetailPhoto);
	public int DelectPhoto(IndetailLjl indetail);
}
