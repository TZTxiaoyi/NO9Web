package com.serviceimpl.ly;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.ProjectsDaoLy;
import com.dao.ly.SinAuditingDao;
import com.entity.ly.AuditingRe;
import com.entity.ly.Project;
import com.entity.tzt.Employee;
import com.service.ly.AddEmployeeService;
@Service
public class AddEmpServiceImpl implements AddEmployeeService{
	@Autowired
	ProjectsDaoLy projectsDaoLy;
	@Autowired
	SinAuditingDao sinAuditingDao;
	
	//给项目添加一个审批人
	public int upProEmplo(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.upProEmployee(projectsid);
	}

	//点击审核时给审核记录一个初始数据，审批人、项目序号、开始审核时间
	public int insAudiRecord(AuditingRe aRe) {
		// TODO Auto-generated method stub
		return projectsDaoLy.insAuditingRe(aRe);
	}

	//修改审核记录表，添加结束时间
	public int upRecTable(Map aRe) {
		// TODO Auto-generated method stub
		return projectsDaoLy.upRecordTab(aRe);
	}

	//查看审核记录表
	public List<Object> selPassProj(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.selPassPro(projectsid);
	}


	public List<Object> selUnPassProj(Project projectsid) {
		// TODO Auto-generated method stub
		return projectsDaoLy.selUnpassPro(projectsid);
	}

	@Override
	public int selEmployState(Project projectsid,AuditingRe aRe,HttpServletRequest request) {
		// TODO Auto-generated method stub
		int ee=(int)request.getSession().getAttribute("empid");//获取员工id(登录后台的)
		System.out.println("ee----------55:"+ee);
		
		projectsid.setApprover(ee);//将员工id放入项目对象中
		//System.out.println("=============:"+projectsid.getApprover());
		aRe.setEmpid(ee);//将员工id放入审核记录对象中
		aRe.setProjectsid(projectsid.getProjectsid());//将项目序号放入审核记录对象中
		//aRe.setRecordtable_begintime(new Date());//将当前时间放入审核记录对象中
	
		//System.out.println("ssssddd"+empid.getEmpid());
		List<Object> eList= projectsDaoLy.selEmProject(projectsid);//查询当前员工是否已经有在审批中的项目
		int flag1=eList.size();
		//System.out.println("-------------888:"+flag1);
		projectsid.setProjectsstate(14);
		if(flag1 != 0){
			return 1;
		}else {			
			sinAuditingDao.upSinProSt(projectsid);//修改项目状态
			System.out.println("begin-----:"+aRe.getRecordtable_begintime());
			projectsDaoLy.insAuditingRe(aRe);//点击审核时给审核记录一个初始数据，审批人、项目序号、开始审核时间、
			int emp=projectsDaoLy.upProEmployee(projectsid);//给项目添加一个审批人
			
			List<Object> sList=sinAuditingDao.selProType(projectsid);//根据项目序号，查询该项目属于个人还是机构
				//System.out.println("-----------aaa:"+flag);
			if (sList.size()==1) {
				sinAuditingDao.deSinProState(projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（1）
				int sin=sinAuditingDao.inSinProState(projectsid);//在所有项目里点击审核，给个人信息审核表一个默认 未审核 的初始值（1）		
			}else{
				sinAuditingDao.deOrProState(projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（1）
				int org=sinAuditingDao.inOrProState(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（1）
			}
			sinAuditingDao.deProIndetailState(projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（2）
			sinAuditingDao.deProDescribeState(projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（3）
			sinAuditingDao.deProReturnState(projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（4）
			
			int pro2=sinAuditingDao.inProIndetailState(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（2）
			int pro3=sinAuditingDao.inProDescribeState(projectsid);//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
			int pro4=sinAuditingDao.inProReturnState(projectsid);//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
			
			return 0;
		}
		
	}
	////根据项目id,去查审批人
	public int selApprover(Project projectsid,HttpServletRequest request){
		int ee=(int)request.getSession().getAttribute("empid");//获取员工id(登录后台的)
			//System.out.println("ee----------55:"+ee);			
			//System.out.println("--------empid:"+ee);
		projectsid.setApprover(ee);
		List<Object> eList= projectsDaoLy.selProjectEmp(projectsid);		
		Map emMap =(Map)eList.get(0);
			//System.out.println("-------------2222:"+emMap.get("APPROVER"));
		Integer approver=Integer.parseInt(emMap.get("APPROVER").toString());
		System.out.println("-----------dddd:"+approver);
		if(approver==ee){
			return 1;//该项目是该员工审核的项目
		}else {
			return 0;//不是
		}
		
	}
}
