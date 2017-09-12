package com.serviceimpl.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.SinAuditingDao;
import com.entity.ly.DetailAuditing;
import com.entity.ly.OrgAuditing;
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
	
	

	
	//修改个人信息审核记录
	public int inProRecord(SinAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inSinProAuRe(projectsid);
	}
	
	//修改机构信息审核记录
	public int inOraProRecord(OrgAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inOraProAuRe(projectsid);
	}
	
	//修改审核项目信息记录
	@Override
	public int inProAuRe(DetailAuditing projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProAuRecord(projectsid);
	}

	

	//修改回报审核记录
	public int inProReturnRer(Map auditing) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProReturnRe(auditing);
	}
	
	//根据项目序号，查询该项目属于 个人 还是 机构
	public int selProTy(Project projectsid) {
		// TODO Auto-generated method stub
		List<Object> sList=sinAuditingDao.selProType(projectsid);
		System.out.println("sList.size----:"+sList.size());
		return sList.size();
	}
	
	//在所有项目里点击审核，给个人信息审核表一个默认未审核的初始值（1）
	public int inserSinSt(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inSinProState(projectsid);
	}

	//在所有项目里点击审核，给机构信息审核表一个默认未审核的初始值（1）
	public int inserOrSt(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inOrProState(projectsid);
	}

	//在所有项目里点击审核，给项目信息审核表一个默认 未审核 的初始值（2）
	public int insertProInSt(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProIndetailState(projectsid);
	}

	//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
	public int inserProDeSt(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProDescribeState(projectsid);
	}

	//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
	public int inserProReSt(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.inProReturnState(projectsid);
	}

	//查询项目描述中的文本
	public List<Object> selProCnnten(Project projectsid) {
		// TODO Auto-generated method stub
		return sinAuditingDao.selProCont(projectsid);
	}

	
	

	
}
