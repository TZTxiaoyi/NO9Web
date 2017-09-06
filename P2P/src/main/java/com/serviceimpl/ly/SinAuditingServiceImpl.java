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


	public List<Object> selSinAuditing(Project projectsid){
		// TODO Auto-generated method stub
		return sinAuditingDao.selSinAu(projectsid);
	}
	
}
