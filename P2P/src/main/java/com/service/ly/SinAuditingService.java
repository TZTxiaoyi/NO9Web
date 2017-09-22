package com.service.ly;

import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.web.bind.annotation.InitBinder;

import com.entity.ly.DetailAuditing;
import com.entity.ly.OrgAuditing;
import com.entity.ly.Project;
import com.entity.ly.RepayAuditing;
import com.entity.ly.SinAuditing;
/**
 * 
 * @author luccy
 *
 */
public interface SinAuditingService {
	public List<Object> selSinAuditing(Project projectsid);//项目个人信息审核
	
	public List<Object> selDeAudi(Project projectsid);//项目信息审核
	public int upSinProSt(Project projectsid);//点击审核项目时，修改项目状态 
	
	
	public int inProRecord(SinAuditing projectsid);//修改个人信息审核记录
	public int inOraProRecord(OrgAuditing projectsid);//修改机构信息审核记录
	
	public int inProAuRe(DetailAuditing projectsid);//修改审核项目信息记录
	
	public int inProReturnRer(Map auditing);//修改回报审核记录
	
	public int selProTy(Project projectsid);//根据项目序号，查询该项目属于个人还是机构
	public int inserSinSt(Project projectsid);//在所有项目里点击审核，给个人信息审核表一个默认未审核的初始值（1）
	public int inserOrSt(Project projectsid);//在所有项目里点击审核，给机构信息审核表一个默认未审核的初始值（1）
	public int insertProInSt(Project projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（2）
	public int inserProDeSt(Project projectsid);//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
	public int inserProReSt(Project projectsid);//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
	
	public List<Object> selProCnnten(Project projectsid);//查询项目描述中的文本
	public int upSinProStEnd(Project projecstid);//完成项目添加项目金额表
}
