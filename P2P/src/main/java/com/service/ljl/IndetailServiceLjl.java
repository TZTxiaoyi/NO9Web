package com.service.ljl;

import java.util.List;
import java.util.Map;

import com.entity.ljl.IndetailLjl;
import com.entity.ljl.IndetailPhotoLjl;
import com.entity.ljl.ProjectsLjl;

public interface IndetailServiceLjl {
	public int SaveIndetail();
	public int UpdateIndetail();
	public List AllIndetail(ProjectsLjl projects);
	public int DeleteIndetail(IndetailLjl indetail);
	
	public int SvaeText(Map map);
	//public Map UpdateText(Map map);
	public int DeleteText(IndetailLjl indetail);
	
	public Map SvaePhoto(Map map, IndetailPhotoLjl IndetailPhoto);
	//public Map UpdatePhoto(Map maps, IndetailPhotoLjl IndetailPhoto);
	public int DeletePhoto(IndetailLjl indetail);
}
