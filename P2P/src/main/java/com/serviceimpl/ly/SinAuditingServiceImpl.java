package com.serviceimpl.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.SinAuditingDao;
import com.entity.ly.DetailAuditing;
import com.entity.ly.Project;
import com.entity.ly.RepayAuditing;
import com.entity.ly.SinAuditing;
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

	/**
	 * 点击审核项目时，修改项目状态 
	 */
	
	public int upSinProSt(Project projecstid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.upSinProSt(projecstid);
	}

	//插入个人信息记录之前先将个人信息记录审核表中的删除
	public int deProRecord(SinAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.deSinProAuRe(projectsid);
	}

	@Override
	public int inProRecord(SinAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inSinProAuRe(projectsid);
	}

	//审核项目信息，点击保存先删除表中该项目之前有的数据
	public int deProjectRe(DetailAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.deProAuRe(projectsid);
	}
	//插入审核项目信息记录
	@Override
	public int inProAuRe(DetailAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProAuRecord(projectsid);
	}

	//插入回报审核之前，先将原有审核记录删除
	public int deProReRecord(RepayAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.deProAuReturn(projectsid);
	}

	//插入回报审核记录
	public int inProReturnRer(Map auditing) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProReturnRe(auditing);
	}
}
