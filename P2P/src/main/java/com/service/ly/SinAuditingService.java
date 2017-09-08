package com.service.ly;

import java.util.List;

import com.entity.ly.Project;
/**
 * 
 * @author luccy
 *
 */
public interface SinAuditingService {
	public List<Object> selSinAuditing(Project projectsid);//项目个人信息审核
	public List<Object> selDeAudi(Project projectsid);//项目信息审核
}
