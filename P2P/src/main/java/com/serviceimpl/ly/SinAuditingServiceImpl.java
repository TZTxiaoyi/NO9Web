package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.SinAuditingDao;
import com.entity.ly.Project;
import com.service.ly.SinAuditingService;

@Service
public class SinAuditingServiceImpl implements SinAuditingService{
	@Autowired
	SinAuditingDao sinAuditingDao;

	/**
	 * 个人项目审核
	 */
	public List<Object> selSinAuditing(Project projectsid){
		// TODO Auto-generated method stub
		return sinAuditingDao.selSinAu(projectsid);
	}


	/**
	 * 项目详情审核
	 */
	public List<Object> selDeAudi(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.selDeAuditing(projectsid);
	}
	
}
