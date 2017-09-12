package com.serviceimpl.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.ProIndetailDao;
import com.entity.ly.DescribeAudi;
import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;
import com.service.ly.ProIndetailService;

@Service
public class ProIndetailServiceImpl implements ProIndetailService{
	/*
	 * 项目信息
	 */
	@Autowired
	ProIndetailDao proIndetailDao;
	public List<Object> selProI(Map mm) {
		// TODO Auto-generated method stub
		return proIndetailDao.selProIn(mm);
	}
	/*
	 * 项目描述
	 */
	public List<Object> selInde( Project projectosid) {
		// TODO Auto-generated method stub
		return proIndetailDao.selDescribe(projectosid);
	}
	//查询项目描述审核记录
	public List<Object> selProDesRe(Project projectsid) {
		// TODO Auto-generated method stub
		return proIndetailDao.selProDeAuRe(projectsid);
	}
	//保存项目描述审核记录
	public int inProDescribeReco(DescribeAudi projectsid) {
		// TODO Auto-generated method stub
		return proIndetailDao.inProDesAuRe(projectsid);
	}
	
}
